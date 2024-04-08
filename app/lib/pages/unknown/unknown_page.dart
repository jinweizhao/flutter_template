import 'package:flutter/material.dart';

class JJUnknownPage extends StatelessWidget {
  static const String routeName = '/unknown';
  const JJUnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("unknown"),
        backgroundColor: Colors.green,
      ),
      body: const Text("unknown"),
    );
  }
}
