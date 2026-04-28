import 'package:flutter/material.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Items',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF273D88)),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const GroceryPage(),
    );
  }
}

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  static const List<GroceryItem> items = [
    GroceryItem('Carrot', 'assets/items/carrot.png'),
    GroceryItem('Orange', 'assets/items/orange.png'),
    GroceryItem('Potato', 'assets/items/potato.png'),
    GroceryItem('Chips', 'assets/items/chips.png'),
    GroceryItem('Tomato', 'assets/items/tomato.png'),
    GroceryItem('Yogurt', 'assets/items/yogurt.png'),
    GroceryItem('Cheese', 'assets/items/cheese.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 900 / 260,
                child: Image.asset(
                  'assets/banner/virtualization.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 24),
              sliver: SliverGrid.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 22,
                  childAspectRatio: 0.96,
                ),
                itemBuilder: (context, index) {
                  return GroceryCard(item: items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryCard extends StatelessWidget {
  const GroceryCard({super.key, required this.item});

  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFFDFEFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F5B6C86),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7, 7, 7, 8),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Item: ${item.name}',
                maxLines: 1,
                style: const TextStyle(
                  color: Color(0xFF6A6F7D),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroceryItem {
  const GroceryItem(this.name, this.imagePath);

  final String name;
  final String imagePath;
}
