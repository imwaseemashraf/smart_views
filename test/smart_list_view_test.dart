import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_views/smart_views.dart';

void main() {
  testWidgets('SmartListView shows emptyWidget when list is empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartListView(
          emptyWidget: const Text("Empty"),
          children: [], // ✅ no items
        ),
      ),
    );

    expect(find.text("Empty"), findsOneWidget);
  });

  testWidgets('SmartListView shows items when list is not empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartListView.builder(
          itemCount: 2,
          emptyWidget: const Text("Empty"),
          itemBuilder: (context, index) => Text("Item $index"), // ✅ fixed
        ),
      ),
    );

    expect(find.text("Item 0"), findsOneWidget);
    expect(find.text("Item 1"), findsOneWidget);
  });
}
