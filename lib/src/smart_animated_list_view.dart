import 'package:flutter/cupertino.dart';

import '../smart_views.dart';

/// -------------------------------
/// Smart AnimatedListView
/// -------------------------------

class SmartAnimatedListView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, int, Animation<double>) itemBuilder;
  final Widget emptyWidget;
  final Duration animationDuration;
  final SmartAnimationType animationType;

  const SmartAnimatedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.emptyWidget,
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationType = SmartAnimationType.fade,
  });

  @override
  State<SmartAnimatedListView<T>> createState() =>
      _SmartAnimatedListViewState<T>();
}

class _SmartAnimatedListViewState<T> extends State<SmartAnimatedListView<T>> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<T> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.items);
  }

  @override
  void didUpdateWidget(covariant SmartAnimatedListView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Insert new items
    for (int i = 0; i < widget.items.length; i++) {
      if (i >= _items.length) {
        _items.insert(i, widget.items[i]);
        _listKey.currentState?.insertItem(
          i,
          duration: widget.animationDuration,
        );
      }
    }

    // Remove deleted items
    if (_items.length > widget.items.length) {
      for (int i = _items.length - 1; i >= widget.items.length; i--) {
        final removedItem = _items.removeAt(i);
        _listKey.currentState?.removeItem(
          i,
          (context, animation) =>
              _buildAnimatedItem(context, i, removedItem, animation),
          duration: widget.animationDuration,
        );
      }
    }
  }

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    T item,
    Animation<double> animation,
  ) {
    Widget child = widget.itemBuilder(context, index, animation);

    switch (widget.animationType) {
      case SmartAnimationType.fade:
        return FadeTransition(opacity: animation, child: child);
      case SmartAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      case SmartAnimationType.scale:
        return ScaleTransition(scale: animation, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return widget.emptyWidget;
    }
    return AnimatedList(
      key: _listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return _buildAnimatedItem(context, index, _items[index], animation);
      },
    );
  }
}
