import 'package:flutter/material.dart';
import 'package:smart_views/smart_views.dart';
import 'package:smart_views/src/smart_animated_list_view.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final items = <String>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smart_widgets demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('smart_widgets demo')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Toggle add/remove to see animations
            setState(() {
              if (items.length < 10) {
                items.add('Item ${items.length + 1}');
              } else {
                items.removeLast();
              }
            });
          },
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 12),
            const Center(child: Text('SmartListView (auto empty-state)')),
            SizedBox(
              height: 200,
              child: SmartListView.builder(
                itemCount: items.length,
                emptyWidget: const Center(child: Text('No items yet')),
                itemBuilder: (context, index) =>
                    ListTile(title: Text(items[index])),
              ),
            ),
            const Divider(),
            const Center(child: Text('SmartGridView (auto empty-state)')),
            SizedBox(
              height: 200,
              child: SmartGridView.builder(
                itemCount: items.length,
                emptyWidget: const Center(child: Text('No grid items')),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    Card(child: Center(child: Text(items[index]))),
              ),
            ),
            const Divider(),
            const Center(child: Text('SmartAnimatedListView')),
            SizedBox(
              height: 260,
              child: SmartAnimatedListView(
                items: items,
                emptyWidget: const Center(
                  child: Text('No animated list items'),
                ),
                animationType: SmartAnimationType.slide,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(items[index]),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            const Center(child: Text('SmartAnimatedGridView')),
            SizedBox(
              height: 260,
              child: SmartAnimatedGridView(
                items: items,
                emptyWidget: const Center(
                  child: Text('No animated grid items'),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                animationType: SmartAnimationType.scale,
                itemBuilder: (context, index, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: Card(child: Center(child: Text(items[index]))),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
