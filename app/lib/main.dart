import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/JJRouter.dart';
import 'package:flutter_template/manager/local_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.preInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
          scaffoldBackgroundColor: Colors.orange,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,

            ///禁止毛玻璃
            elevation: 1,
          ),
          // appBarTheme: const AppBarTheme(color: Colors.red),
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.blue),
          // 2.primarySwatch: primaryColor/accentColor的结合体
          // 3.主要颜色: 导航/底部TabBar
          primaryColor: Colors.green,
          // 5.卡片主题
          cardTheme: CardTheme(
              color: Colors.greenAccent,
              elevation: 10,
              shape: Border.all(width: 3, color: Colors.red),
              margin: const EdgeInsets.all(10)),

          ///禁用掉 点击按钮的水波纹效果 包括底部tabbaritem点击的效果
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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
