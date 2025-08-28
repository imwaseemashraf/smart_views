import 'package:flutter/material.dart';

class SmartPageView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget emptyWidget;
  final PageController? controller;
  final bool pageSnapping;
  final Axis scrollDirection;
  final ValueChanged<int>? onPageChanged;

  const SmartPageView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.emptyWidget,
    this.controller,
    this.pageSnapping = true,
    this.scrollDirection = Axis.horizontal,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return emptyWidget;
    }

    return PageView.builder(
      controller: controller,
      pageSnapping: pageSnapping,
      scrollDirection: scrollDirection,
      itemCount: items.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => itemBuilder(context, index),
    );
  }
}
