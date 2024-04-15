import 'package:flutter/material.dart';

import 'pages/about/AboutPage.dart';
import 'pages/animationDemo/AnimationDemoPage.dart';
import 'pages/main/main.dart';
import 'pages/unknown/unknown_page.dart';

class JJRouter {
  static final Map<String, WidgetBuilder> routes = {
    ///注册路由
    JJAboutPage.routeName: (context) => const JJAboutPage(),

    WZMainPage.routeName: (context) => const WZMainPage(),

    AnimationDemoPage.routeName: (context) => const AnimationDemoPage(),
  };

  static final String initialRoute = WZMainPage.routeName;

  static RouteFactory getGenerateRoute() {
    return (settings) {
      ///settings.arguments   获取跳转的参数
      ///
      ///在to 的页面获取上个页面传来的数据 final model = ModalRoute.of(context).settings.arguments as DetailModel
      if (settings.name == "/about") {
        return MaterialPageRoute(builder: (ctx) {
          return const JJAboutPage();
        });
      }
      return null;
    };
  }

  static RouteFactory getUnknownRoute() {
    return (settings) {
      return MaterialPageRoute(builder: (ctx) {
        return const JJUnknownPage();
      });
    };
  }

  // static final RouteFactory unknownRoute = (settings) {
  //   return MaterialPageRoute(builder: (ctx) {
  //     return const JJUnknownPage();
  //   });
  // };
}
