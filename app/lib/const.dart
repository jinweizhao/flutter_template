import 'package:flutter/material.dart';

//主题色
const Color themeColor = Colors.red;

//屏幕的宽 / 高
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//三方登录
const List<String> googleScopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
