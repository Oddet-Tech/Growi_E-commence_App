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
   Column(
  children: [
    Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('assets/iphone8plus.webp', fit: BoxFit.contain),
        ),
        title: const Text('iPhone 8 Plus'),
        subtitle: const Text('R3000'),
        trailing: const Text(
          'View',
          style: TextStyle(color: Colors.green),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailsScreen(),
            ),
          );
        },
      ),
    ),

    Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('assets/iphoneX.webp', fit: BoxFit.contain),
        ),
        title: const Text('iPhone X'),
        subtitle: const Text('R3800'),
        trailing: const Text(
          'View',
          style: TextStyle(color: Colors.green),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailsScreen2(),
            ),
          );
        },
      ),
    ),

    Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('assets/iphoneXS.webp', fit: BoxFit.contain),
        ),
        title: const Text('iPhone XS'),
        subtitle: const Text('R4200'),
        trailing: const Text(
          'View',
          style: TextStyle(color: Colors.green),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailsScreen4(),
            ),
          );
        },
      ),
    ),

    Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset('assets/iphoneXR.webp', fit: BoxFit.contain),
        ),
        title: const Text('iPhone XR'),
        subtitle: const Text('R4800'),
        trailing: const Text(
          'View',
          style: TextStyle(color: Colors.green),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ItemDetailsScreen3(),
            ),
          );
        },
      ),
    ),
  ],
)

        ]
        ));

  }
}