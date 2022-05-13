import 'package:flutter/material.dart';
import 'package:fruitector/landing.dart';
import 'dart:async';

void main() {
  runApp(Fruitector());
}

class Fruitector extends StatelessWidget {
  const Fruitector({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruitector',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Container(
        color: Color.fromRGBO(158, 214, 180, 1),
        child: Image.asset('images/farmer.png'));
  }
}
