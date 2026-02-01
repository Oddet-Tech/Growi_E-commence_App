import 'package:flutter/material.dart';
import 'screens/home_screen.dart' show HomePage;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Growi.App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final int pricePerUnit;
  final Function(int quantity) onQuantityChanged;

  const CounterWidget({
    super.key,
    required this.pricePerUnit,
    required this.onQuantityChanged,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 1; // start from 1 item

  void _increment() {
    setState(() {
      _counter++;
    });
    widget.onQuantityChanged(_counter);
  }

  void _decrement() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
      widget.onQuantityChanged(_counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: _decrement, icon: const Icon(Icons.remove)),
            Text('$_counter', style: const TextStyle(fontSize: 20)),
            IconButton(onPressed: _increment, icon: const Icon(Icons.add)),
          ],
        ),
        Text(
          'Total: R${_counter * widget.pricePerUnit}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class SecondAmount extends StatefulWidget {
  const SecondAmount({super.key});
  @override
  State<SecondAmount> createState() => _SecondAmountState();
}
class _SecondAmountState extends State<SecondAmount> {
  int _counter = 0;
  final int _pricePerUnit = 100; // R100 per unit

  void _increment() {
    setState(() {
      _counter++;
    });
  }
  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:1),
                  child: ElevatedButton(
                    onPressed: _decrement,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF8EED2),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.only(bottom: 10),
                    ),
                    child: const Icon(Icons.remove, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1),
                  child: ElevatedButton(
                    onPressed: _increment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 141, 209),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.only(bottom: 10),
                    ),
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Total: R${_counter * _pricePerUnit}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
