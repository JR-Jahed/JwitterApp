import 'package:flutter/material.dart';
import 'package:jwitter/routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jwitter',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(createAccountRoute);
            },
            child: const Text(
              'Create Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
