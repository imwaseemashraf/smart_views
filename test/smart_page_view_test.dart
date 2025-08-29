import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_views/src/smart_page_view.dart';

void main() {
  testWidgets('SmartPageView shows emptyWidget when no items', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SmartPageView(
          items: [],
          emptyWidget: const Text("Nothing Here"),
          itemBuilder: (context, index) => Text("Page $index"),
        ),
      ),
    );

    expect(find.text("Nothing Here"), findsOneWidget);
  });

  testWidgets('SmartPageView shows items when items exist', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          height: 200,
          child: SmartPageView<String>(
            items: ["One", "Two"],
            emptyWidget: const Text("Nothing Here"),
            itemBuilder: (context, index) =>
                Text("Page ${["One", "Two"][index]}"),
          ),
        ),
      ),
    );

    expect(find.text("Page One"), findsOneWidget);
  });
}
