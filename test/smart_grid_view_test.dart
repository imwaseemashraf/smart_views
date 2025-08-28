import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_views/smart_views.dart';
void main() {
  testWidgets('SmartGridView shows emptyWidget when list is empty', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartGridView.builder(
          itemCount: 0,
          emptyWidget: const Text("No Data"),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) => Text("Item $index"),
        ),
      ),
    );

    expect(find.text("No Data"), findsOneWidget);
  });

  testWidgets('SmartGridView shows items when list is not empty', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartGridView.builder(
          itemCount: 2,
          emptyWidget: const Text("No Data"),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) => Text("Item ${["X", "Y"][index]}"),
        ),
      ),
    );

    expect(find.text("Item X"), findsOneWidget);
    expect(find.text("Item Y"), findsOneWidget);
  });
}
