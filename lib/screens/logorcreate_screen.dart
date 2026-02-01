import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/features_screen.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}
class _SecondScreenState extends State<SecondScreen> {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back',style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: const Color(0xFFF8EED2),
      ),
      body:Center(child:ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Enter Username or Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left:150,right: 150),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RealHome(
                            name: 'User',
                            email: emailController.text,
                          )),
                    );
              },
              child: const Text('Login',style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
          ),
        ],
      )
     ) );
  }
}
class NewAccountScreen extends StatefulWidget {
  const NewAccountScreen({super.key});

  @override
  State<NewAccountScreen> createState() => _NewAccountScreenState();
}
class _NewAccountScreenState extends State<NewAccountScreen> {
  TextEditingController fullNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Account',style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: const Color(0xFFF8EED2),
      ),
      body:Center(child:ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
           TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: fullNameController,
            decoration: const InputDecoration(
              labelText: 'Enter Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left:150,right: 150),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RealHome(
                            name: fullNameController.text,
                            email: emailController.text,
                          )),
                    );
              },
              child: const Text('Create',style: TextStyle(fontSize: 20,color: Colors.black),),
            ),
          ),
        ],
      ),
     ) 
     );
  }
}
