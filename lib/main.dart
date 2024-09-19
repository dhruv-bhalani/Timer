
import 'package:flutter/material.dart';
import 'package:timer/utils/route.dart';
import 'package:timer/views/pages/home_page/home_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        MyRoute.homepage: (context) => const HomePage(),
      },
    );
  }
}
