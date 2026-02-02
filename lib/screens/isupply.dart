import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/iphone8.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ISupply'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          /// iPhone 8+
          Card(
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(strokeWidth: 2),
                    Image.asset(
                      'assets/iphone8plus.webp',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              title: const Text("Iphone 8+ 64GB"),
              subtitle: const Text("R3000"),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsScreen(),
                    ),
                  );
                },
                child: const Text("View"),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// iPhone X
          Card(
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircularProgressIndicator(strokeWidth: 2),
                    Image.asset(
                      'assets/iphoneX.webp',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              title: const Text("Iphone X 64GB"),
              subtitle: const Text("R3800"),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ItemDetailsScreen2(),
                    ),
                  );
                },
                child: const Text("View"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
