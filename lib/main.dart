import 'package:flutter/material.dart';
import 'package:fruitector/landing.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:fruitector/theme/app_translation.dart';

void main() {
  runApp(Fruitector());
}

class Fruitector extends StatelessWidget {
  const Fruitector({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fruitector',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double height, width;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandingPage())));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
        color: Color.fromRGBO(158, 214, 180, 1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: height * .2,
                width: height * .2,
                child: Image.asset('images/logo.png'),
              ),
              const Text(
                'FRUiTECTOR',
                style: TextStyle(
                    fontSize: 45.0,
                    color: Color.fromRGBO(14, 82, 41, 1),
                    fontFamily: 'Permanent_Marker'),
              ),
            ]));
  }
}
