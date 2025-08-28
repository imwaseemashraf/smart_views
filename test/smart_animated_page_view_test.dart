import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_views/smart_views.dart';
void main() {
  testWidgets('SmartAnimatedPageView shows emptyWidget when no items', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartAnimatedPageView<String>(
          items: [],
          emptyWidget: const Text("Empty Pages"),
          itemBuilder: (context, index) => Text("Page $index"),
        ),
      ),
    );

    expect(find.text("Empty Pages"), findsOneWidget);
  });

  testWidgets('SmartAnimatedPageView shows pages when items exist', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          height: 300,
          child: SmartAnimatedPageView<String>(
            items: ["A", "B"],
            emptyWidget: const Text("Empty Pages"),
            animationType: PageAnimationType.scale,
            itemBuilder: (context, index) => Text("Page ${["A", "B"][index]}"),
          ),
        ),
      ),
    );

    expect(find.text("Page A"), findsOneWidget);
  });
}
