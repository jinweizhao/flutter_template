import 'package:flutter/material.dart';

import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        backgroundColor: Colors.green,
      ),
      body: const HomeContent(),
    );
  }
}
