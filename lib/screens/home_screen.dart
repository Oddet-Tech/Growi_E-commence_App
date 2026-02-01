import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/logorcreate_screen.dart' show SecondScreen, NewAccountScreen;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFFF8EED2),
      ),
      backgroundColor: const Color(0xFFF8EED2),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left:10,top: 100,bottom: 10),
              title: Image.asset(
                'assets/Icon.png',
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150,right: 150,bottom: 20,top:8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: FloatingActionButton(
                  onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen()),
                    ); },
                  backgroundColor: const Color.fromARGB(255, 230, 228, 185),
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(left: 80.0,right: 80),
              child: TextButton(
                onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewAccountScreen()),
                      ); },
                child: const Text(
                 'don\'t have an account? ' 'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}