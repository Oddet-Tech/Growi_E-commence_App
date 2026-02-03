import 'package:flutter/material.dart';

class CartManager {
  CartManager._privateConstructor();
  static final CartManager instance = CartManager._privateConstructor();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    int index =
        _items.indexWhere((e) => e.name == item.name && e.price == item.price);
    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
  }

  void clearCart() => _items.clear();
}

class CartItem {
  String name;
  int price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}

// ---------------- Cart Screen ----------------
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.instance.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text("Quantity: ${item.quantity}"),
                  trailing: Text("R${item.price * item.quantity}"),
                );
              },
            ),
    );
  }
}

class ItemDetailsScreenBase extends StatefulWidget {
  final String name;
  final int price;
  final String imageAsset;

  const ItemDetailsScreenBase(
      {super.key,
      required this.name,
      required this.price,
      required this.imageAsset});

  @override
  State<ItemDetailsScreenBase> createState() => _ItemDetailsScreenBaseState();
}

class _ItemDetailsScreenBaseState extends State<ItemDetailsScreenBase> {
  int quantity = 1;
  bool isAddedToCart = false;

  int get totalPrice => quantity * widget.price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Image Container
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
                      placeholder: AssetImage(widget.imageAsset),
                      image: AssetImage(widget.imageAsset),
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
            // Price and Quantity
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
                    const Text("Items", style: TextStyle(fontSize: 16)),
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
                  CartManager.instance.addItem(CartItem(
                      name: widget.name, price: widget.price, quantity: quantity));
                  setState(() {
                    isAddedToCart = true;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to Cart!")),
                  );
                },
                child: Text(
                  isAddedToCart ? "Add to Cart" : "Add to Cart",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}