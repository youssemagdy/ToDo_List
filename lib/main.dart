import 'package:flutter/material.dart';
import 'package:todo_list_3/layout/home/home_page.dart';
import 'package:todo_list_3/layout/login/login_page.dart';
import 'package:todo_list_3/layout/regester/regester_page.dart';
import 'package:todo_list_3/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: 'ToDo List',
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (_) => LoginPage(),
        RegesterPage.routeName: (_) => RegesterPage(),
        HomePage.routeName: (_) => const HomePage(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
}