import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => Controller(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spelling Bee',
      theme: ThemeData(
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'PartyConfetti',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      home: const HomePage(),
    );
  }
}
