library;

import 'package:flutter/widgets.dart';

/// SmartListView with emptyWidget support
class SmartListView extends ListView {
  final Widget? emptyWidget;
  final int? smartItemCount;

  SmartListView({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    super.children,
    super.itemExtent,
    super.prototypeItem,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.emptyWidget,
  }) : smartItemCount = children.length;

  SmartListView.builder({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.itemBuilder,
    super.itemCount,
    super.itemExtent,
    super.prototypeItem,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.emptyWidget,
  }) : smartItemCount = itemCount,
       super.builder();

  SmartListView.separated({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.itemBuilder,
    required super.separatorBuilder,
    required super.itemCount,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.emptyWidget,
  }) : smartItemCount = itemCount,
       super.separated();

  @override
  Widget buildChildLayout(BuildContext context) {
    if ((smartItemCount ?? 0) == 0) {
      return SliverToBoxAdapter(child: emptyWidget ?? const SizedBox());
    }
    return super.buildChildLayout(context);
  }
}

/// SmartGridView with emptyWidget support
class SmartGridView extends GridView {
  final Widget? emptyWidget;
  final int? smartItemCount;

  SmartGridView({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.gridDelegate,
    super.children,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.emptyWidget,
  }) : smartItemCount = children.length;

  SmartGridView.builder({
    super.key,
    super.scrollDirection,
    super.reverse,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.padding,
    required super.gridDelegate,
    required super.itemBuilder,
    super.itemCount,
    super.cacheExtent,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
    this.emptyWidget,
  }) : smartItemCount = itemCount,
       super.builder();

  @override
  Widget buildChildLayout(BuildContext context) {
    if ((smartItemCount ?? 0) == 0) {
      return SliverToBoxAdapter(child: emptyWidget ?? const SizedBox());
    }
    return super.buildChildLayout(context);
  }
}
