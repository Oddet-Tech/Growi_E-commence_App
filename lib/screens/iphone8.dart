import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/cart.dart';



// ---------------- Specific Item Screens ----------------
class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemDetailsScreenBase(
      name: "iPhone 8 Plus",
      price: 3000,
      imageAsset: "Assets/iphone8plus.webp",
    );
  }
}

class ItemDetailsScreen2 extends StatelessWidget {
  const ItemDetailsScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemDetailsScreenBase(
      name: "iPhone X",
      price: 3800,
      imageAsset: "Assets/iphoneX.webp",
    );
  }
}

class ItemDetailsScreen3 extends StatelessWidget {
  const ItemDetailsScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemDetailsScreenBase(
      name: "iPhone XR",
      price: 4800,
      imageAsset: "Assets/iphoneXR.webp",
    );
  }
}

class ItemDetailsScreen4 extends StatelessWidget {
  const ItemDetailsScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemDetailsScreenBase(
      name: "iPhone XS",
      price: 4200,
      imageAsset: "Assets/iphoneXS.webp",
    );
  }
}