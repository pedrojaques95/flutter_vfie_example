import 'package:flutter/material.dart';
import 'package:flutter_app/screens/splash_screen.dart';
import 'package:flutter_app/screens/terms_conditions_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/terms_conditions_screen': (context) => TermsConditionsScreen()
      },
    ));
