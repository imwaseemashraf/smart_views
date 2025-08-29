import 'package:flutter/cupertino.dart';

/// -------------------------------
/// Smart SliverList
/// -------------------------------
class SmartSliverList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? emptyWidget;

  const SmartSliverList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return SliverToBoxAdapter(child: emptyWidget ?? const SizedBox());
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
    );
  }
}
