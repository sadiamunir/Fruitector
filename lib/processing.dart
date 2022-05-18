// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:fruitector/display.dart';
import 'package:tflite/tflite.dart';

class Process extends StatefulWidget {
  Process({Key? key, this.imageFile});
  PickedFile? imageFile;

  @override
  _ProcessState createState() => _ProcessState(imageFile!);
}

class _ProcessState extends State<Process> {
  bool _loading = true;
  bool _isDisabledBtn = true;
  String txt = 'Processing..';
  late double height, width;
  late PickedFile imageFile;

  List? _result;
  String _confidence = "";
  String _name = "";

  loadModel() async {
    var resultant = await Tflite.loadModel(
        labels: 'assets/labels.txt',
        model: 'assets/final_model_flutter.tflite');
    print('After loading model: $resultant');
  }

  applyImageModel(PickedFile file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 6,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _result = res;

      String str = _result![0]['label'];
      _name = str.substring(0);
      _confidence = _result != null
          ? (_result![0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();

    Timer(const Duration(seconds: 1, milliseconds: 230), () {
      setState(() {
        applyImageModel(imageFile);

        txt = 'Processing Complete';
        _isDisabledBtn = false;
        _loading = false;
      });
    });
  }

  _ProcessState(this.imageFile);
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: height * 0.05),
                      padding: const EdgeInsets.all(10),
                      height: height * 0.1,
                      width: width * 0.75,
                      decoration: BoxDecoration(
                        color: _isDisabledBtn
                            ? const Color.fromARGB(80, 75, 85, 79)
                            : const Color.fromARGB(200, 24, 143, 71),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(130)),
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
                          _navigateToNextScreen(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Icon(
                              Icons.receipt_long,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              "See Results",
                              style: TextStyle(
                                fontFamily: 'Alata',
                                fontWeight: FontWeight.bold,
                                fontSize: 27.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          top: height * 0.05, bottom: height * 0.1),
                      height: height * 0.1,
                      width: width * 0.75,
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
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Icon(
                              Icons.image,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              "Re-Upload",
                              style: TextStyle(
                                fontFamily: 'Alata',
                                fontWeight: FontWeight.bold,
                                fontSize: 27.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
            Container(
              height: height * 0.35,
              width: width * 0.75,
              margin: EdgeInsets.only(top: height * 0.35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    txt,
                    style: const TextStyle(
                      fontFamily: 'Alata',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromRGBO(14, 82, 41, 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.05),
                    padding: const EdgeInsets.all(12.0),
                    child: _loading ? const LinearProgressIndicator() : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Display(
            imageimport1: imageFile, name: _name, confidence: _confidence)));
  }
}
