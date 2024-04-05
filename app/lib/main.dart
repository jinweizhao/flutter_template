import 'package:flutter/material.dart';

import 'pages/main/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,

          ///禁用掉 点击按钮的水波纹效果 包括底部tabbaritem点击的效果
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      home: const WZMainPage(),
    );
  }
}
 