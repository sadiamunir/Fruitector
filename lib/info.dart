// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:fruitector/display.dart';
import 'package:get/get.dart';
import 'package:fruitector/theme/storage.dart';

class infoDisplay extends StatefulWidget {
  infoDisplay(
      {Key? key, this.imageFile, required this.detail, required this.name});
  PickedFile? imageFile;
  String detail;
  String name;

  @override
  _infoDisplayState createState() =>
      _infoDisplayState(imageFile!, detail, name);
}

class _infoDisplayState extends State<infoDisplay> {
  late double height, width;
  late PickedFile imageFile;
  String detail;
  String name;

  _infoDisplayState(this.imageFile, this.detail, this.name);

  bool urdu = false;

  void langtoggle() {
    if (urdu == false) {
      controller.changelanguage('ur', 'AE');
      urdu = true;
    } else {
      controller.changelanguage('en', 'US');
      urdu = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 0.30,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              color: const Color.fromARGB(200, 24, 143, 71),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: width * 0.6),
                  Container(
                    height: height * 0.04,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color.fromARGB(255, 132, 204, 161),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ),
                      child: Text('lang'.tr),
                      onPressed: () {
                        langtoggle();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.75,
              width: width * 1,
              margin: EdgeInsets.only(top: height * 0.25),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.15),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'About'.tr + name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: 'Alata',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color.fromRGBO(14, 82, 41, 1),
                            ),
                          ),
                          Text(
                            detail,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontFamily: 'Alata',
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            Container(
              height: height * 0.27,
              width: height * 0.27,
              margin: EdgeInsets.only(top: height * 0.15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Card(
                color: Color.fromARGB(200, 24, 143, 71),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(File((imageFile.path))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
