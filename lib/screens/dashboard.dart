import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  final String name;
  final String email;
  
  const Dashboard({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                widget.name.isNotEmpty ? widget.name[0].toUpperCase() : 'U',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              widget.name.isNotEmpty ? widget.name : 'User',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              widget.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
