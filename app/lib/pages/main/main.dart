import 'package:flutter/material.dart';
import 'package:flutter_template/manager/local_storage.dart';

import '../home/home_page.dart';
import '../profile/profile_page.dart';

class WZMainPage extends StatefulWidget {
  static String routeName = '/';
  const WZMainPage({super.key});

  @override
  State<WZMainPage> createState() => _WZMainPageState();
}

class _WZMainPageState extends State<WZMainPage> {
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [HomePage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          useLegacyColorScheme: false,
          onTap: (value) {
            LocalStorage.getInstance()
                .setString("currentIndex", value.toString());
            final a = LocalStorage.getInstance().getString("currentIndex");
            debugPrint(a);
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max),
              activeIcon: Icon(Icons.home_mini),
              label: "首页",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.center_focus_strong),
                label: "我的"),
          ]),
    );
  }
}
