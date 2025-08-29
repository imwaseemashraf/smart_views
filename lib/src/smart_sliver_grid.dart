import 'package:flutter/cupertino.dart';

/// -------------------------------
/// Smart SliverGrid
/// -------------------------------

class SmartSliverGrid extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final SliverGridDelegate gridDelegate;
  final Widget? emptyWidget;

  const SmartSliverGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.gridDelegate,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return SliverToBoxAdapter(child: emptyWidget ?? const SizedBox());
    }
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
      gridDelegate: gridDelegate,
    );
  }
}
