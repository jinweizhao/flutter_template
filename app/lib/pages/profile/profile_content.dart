import 'dart:math';

import 'package:flutter/material.dart';

import '../about/AboutPage.dart';

class ProfileContent extends StatefulWidget {
  final String _message = "init";

  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(context).pushNamed(JJAboutPage.routeName);
            },
            child: const Text('to detail'),
          ),
          Text(
            widget._message,
            style: const TextStyle(fontSize: 20, color: Colors.red),
          )
        ],
      ),
    );
  }
}
