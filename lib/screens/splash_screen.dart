import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_app/services/cms.dart';
import 'package:flutter_app/dto/mcare_terms_privacy.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //vars & const
  McareTermsPrivacyCMS instance;
  McareTermsPrivacy response;

  void getTermsAndConditionsCMS() async {
    instance = McareTermsPrivacyCMS();
    response = await instance.getContent();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/terms_conditions_screen',
          arguments: {'McareTermsPrivacy': response});
    });
  }

  @override
  void initState() {
    super.initState();
    getTermsAndConditionsCMS();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent[700],
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(40.0),
            children: [Lottie.asset('assets/vfSplashLottie.json')],
          ),
        ),
      ),
    );
  }
}
