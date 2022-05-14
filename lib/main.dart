import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_game/Auth/wrapper.dart';
import 'package:next_game/Frontend/HomePage.dart';

import 'Auth/SignInUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Next Game?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Tajawal",
        primaryColor: Colors.blue
      ),
      // home: const Wrapper(),
        home: const SignInUpPage()
        // home: const HomePage()
    );
  }
}

