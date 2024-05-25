import 'package:bsv_new/view/splashView.dart';
import 'package:flutter/material.dart';

import 'appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  /*
  * launcher class*/
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home:  const SplashView(),
    );
  }
}

