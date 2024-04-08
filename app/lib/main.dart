import 'package:flutter/material.dart';
import 'package:flutter_template/JJRouter.dart';

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
      initialRoute: JJRouter.initialRoute,
      routes: JJRouter.routes,

      ///自定义跳转
      onGenerateRoute: JJRouter.getGenerateRoute(),

      ///设置无法找到路由的处理  未知页面的处理
      onUnknownRoute: JJRouter.getUnknownRoute(),
    );
  }
}
