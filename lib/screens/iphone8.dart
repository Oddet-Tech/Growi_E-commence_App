import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int quantity = 1;
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
        actions: [
          if (isAddedToCart)
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigate to cart screen later
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Big Container with Image
         Container(
  height: 200,
  width: 300,
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(20),
    image: const DecorationImage(
      image: AssetImage("Assets/iphoneX.webp"),
      fit: BoxFit.contain,
    ),
  ),
),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "R3800",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    const Text(
                      "Items",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: quantity,
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index + 1,
                          child: Text("${index + 1}"),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          quantity = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAddedToCart = true;
                  });
                },
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
