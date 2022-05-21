// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruitector/processing.dart';
import 'package:fruitector/theme/storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  PickedFile? imageFile;
  bool isDisabledBtn = true;
  late double height, width;
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

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose".tr,
              style: TextStyle(
                color: Color.fromARGB(200, 24, 143, 71),
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Color.fromARGB(200, 24, 143, 71),
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("gallery".tr,
                        style: TextStyle(
                          fontFamily: 'Alata',
                          fontSize: 15,
                        )),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color.fromARGB(200, 24, 143, 71),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color.fromARGB(200, 24, 143, 71),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text(
                      "camera".tr,
                      style: TextStyle(
                        fontFamily: 'Alata',
                        fontSize: 15,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera_alt_rounded,
                      color: Color.fromARGB(200, 24, 143, 71),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              height: height * 0.25,
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              color: const Color.fromARGB(200, 24, 143, 71),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      "source".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Alata',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
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
                      )),
                ],
              ),
            ),
            Positioned(
              top: height * 0.18,
              left: width * 0.07,
              child: Container(
                height: height * 0.6,
                width: width * 0.86,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(158, 214, 180, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 4,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: (imageFile == null)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.upload_file_sharp,
                              size: 60,
                              color: Colors.red,
                            ),
                            Text(
                              "Add image".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Alata',
                                fontSize: 25,
                                color: Color.fromARGB(253, 235, 11, 11),
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        )
                      : Container(
                          height: height * 0.8,
                          width: width * 0.6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(File((imageFile!.path))),
                          ),
                        ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: height * 0.83),
                  padding: const EdgeInsets.all(10),
                  height: height * 0.1,
                  width: width * .42,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(200, 24, 143, 71),
                    borderRadius: BorderRadius.all(Radius.circular(130)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        blurRadius: 4,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    textColor: Colors.white,
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    child: (imageFile == null)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.search_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Add".tr,
                                style: TextStyle(
                                  fontFamily: 'Alata',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(
                                Icons.replay_circle_filled_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text(
                                "Re".tr,
                                style: TextStyle(
                                  fontFamily: 'Alata',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: height * 0.83),
                  height: height * 0.1,
                  width: width * .42,
                  decoration: BoxDecoration(
                    color: isDisabledBtn
                        ? const Color.fromARGB(80, 75, 85, 79)
                        : const Color.fromARGB(200, 24, 143, 71),
                    borderRadius: const BorderRadius.all(Radius.circular(130)),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        blurRadius: 4,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    textColor: Colors.white,
                    onPressed: () {
                      (imageFile == null)
                          ? null
                          : _navigateToNextScreen(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.content_paste_go,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          "Detect".tr,
                          style: TextStyle(
                            fontFamily: 'Alata',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
    isDisabledBtn = false;
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
    isDisabledBtn = false;
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Process(
              imageFile: imageFile,
            )));
  }
}
