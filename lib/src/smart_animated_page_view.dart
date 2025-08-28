
import 'package:flutter/material.dart';

enum PageAnimationType {
  fade,
  scale,
  rotate,
  slide,
}

class SmartAnimatedPageView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget emptyWidget;
  final PageController? controller;
  final Axis scrollDirection;
  final ValueChanged<int>? onPageChanged;
  final PageAnimationType animationType;

  const SmartAnimatedPageView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.emptyWidget,
    this.controller,
    this.scrollDirection = Axis.horizontal,
    this.onPageChanged,
    this.animationType = PageAnimationType.fade,
  });

  @override
  State<SmartAnimatedPageView<T>> createState() => _SmartAnimatedPageViewState<T>();
}

class _SmartAnimatedPageViewState<T> extends State<SmartAnimatedPageView<T>> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? PageController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return widget.emptyWidget;
    }

    return PageView.builder(
      controller: _controller,
      scrollDirection: widget.scrollDirection,
      itemCount: widget.items.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double value = 1.0;

            if (_controller.position.haveDimensions) {
              value = _controller.page! - index;
            } else {
              value = (_controller.initialPage - index).toDouble();
            }

            // Apply animations
            switch (widget.animationType) {
              case PageAnimationType.fade:
                return Opacity(
                  opacity: (1 - value.abs()).clamp(0.0, 1.0),
                  child: child,
                );
              case PageAnimationType.scale:
                double scale = (1 - value.abs()).clamp(0.8, 1.0);
                return Transform.scale(scale: scale, child: child);
              case PageAnimationType.rotate:
                double rotation = value * 0.5;
                return Transform.rotate(angle: rotation, child: child);
              case PageAnimationType.slide:
                double offset = value * 200;
                return Transform.translate(offset: Offset(offset, 0), child: child);
            }
          },
          child: widget.itemBuilder(context, index),
        );
      },
    );
  }
}
