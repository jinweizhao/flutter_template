import 'package:flutter/material.dart';

class JJAboutPage extends StatelessWidget {
  static const String routeName = '/about';
  const JJAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about"),
        backgroundColor: Colors.green,
      ),
      body: const Text("about"),
    );
  }
}
