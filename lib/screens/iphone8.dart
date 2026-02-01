import 'package:flutter/material.dart';


class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int quantity = 1;
  bool isAddedToCart = false;
  
  get totalPrice => quantity * 3000; // Assuming each item costs R3000
  
  get pricePerUnit => 3000;

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
  ),
 child: ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Stack(
    alignment: Alignment.center,
    children: [
      const CircularProgressIndicator(),
      FadeInImage(
        placeholder: const AssetImage("Assets/iphone8plus.webp"),
        image: const AssetImage("Assets/iphone8plus.webp"),
        fit: BoxFit.contain,
        fadeInDuration: const Duration(milliseconds: 300),
        placeholderFit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: Icon(
              Icons.error,
              color: Colors.grey.shade500,
              size: 40,
            ),
          );
        },
      ),
    ],
  ),
),

),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "R$totalPrice",
                  style: const TextStyle(
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
class ItemDetailsScreen2 extends StatefulWidget {
  const ItemDetailsScreen2({super.key});

  @override
  State<ItemDetailsScreen2> createState() => _ItemDetailsScreen2State();
}

class _ItemDetailsScreen2State extends State<ItemDetailsScreen2> {
  int quantity = 1;
  bool isAddedToCart = false;
  
  get totalPrice => quantity * 3800; // Assuming each item costs R3000
  
  get pricePerUnit => 3800;

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
  ),
 child: ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Stack(
    alignment: Alignment.center,
    children: [
      const CircularProgressIndicator(),
      FadeInImage(
        placeholder: const AssetImage("Assets/iphoneX.webp"),
        image: const AssetImage("Assets/iphoneX.webp"),
        fit: BoxFit.contain,
        fadeInDuration: const Duration(milliseconds: 300),
        placeholderFit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey.shade300,
            child: Icon(
              Icons.error,
              color: Colors.grey.shade500,
              size: 40,
            ),
          );
        },
      ),
    ],
  ),
),

),
          const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "R$totalPrice",
                  style: const TextStyle(
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
