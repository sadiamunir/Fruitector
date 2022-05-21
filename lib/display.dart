// ignore_for_file: must_be_immutable, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fruitector/info.dart';
import 'package:get/get.dart';
import 'package:fruitector/theme/storage.dart';

class Display extends StatefulWidget {
  PickedFile imageimport1;
  String name;
  String confidence;
  Display(
      {Key? key,
      required this.imageimport1,
      required this.confidence,
      required this.name})
      : super(key: key);

  @override
  _DisplayState createState() => _DisplayState(imageimport1, confidence, name);
}

class _DisplayState extends State<Display> {
  late double height, width;
  PickedFile imageimport1;
  String name;
  String confidence;

  late String detail;

  _DisplayState(this.imageimport1, this.confidence, this.name);

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
                    flex: 12,
                    child: Text(
                      "Your Result".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Alata',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
                    ),
                  )
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
                  children: <Widget>[
                    Container(
                      height: height * 0.2,
                      width: width * .9,
                      margin: EdgeInsets.only(top: height * 0.20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 4,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'fruit'.tr,
                                      style: TextStyle(
                                        fontFamily: 'Alata',
                                        fontSize: 25,
                                      ),
                                    ),
                                    TextSpan(
                                        text: name.toUpperCase(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Alata',
                                          fontSize: 20,
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 160),
                                height: 50.0,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(200, 24, 143, 71),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(130)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      blurRadius: 4,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    "See".tr,
                                    style: TextStyle(
                                      fontFamily: 'Alata',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    detailAssign(name);
                                    _navigateToNextScreen(context);
                                  },
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Container(
                      height: height * 0.2,
                      width: width * .90,
                      margin: EdgeInsets.only(top: height * 0.03),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 4,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Percentage'.tr + confidence,
                                style: const TextStyle(
                                  fontFamily: 'Alata',
                                  fontSize: 25,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 160),
                                height: 50.0,
                                width: 130,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(200, 24, 143, 71),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(130)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.3),
                                      blurRadius: 4,
                                      offset: Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: MaterialButton(
                                  child: Text(
                                    "Learn".tr,
                                    style: TextStyle(
                                      fontFamily: 'Alata',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                height: height * 0.8,
                width: double.infinity,
                margin: EdgeInsets.only(top: height * 0.92),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  border: Border(
                    top: BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 180, 187, 190)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      splashColor: const Color.fromARGB(255, 144, 147, 150),
                      onPressed: () {
                        detailAssign(name);
                        _createpdf();
                      },
                      child: const Icon(Icons.download_outlined,
                          color: Color.fromARGB(255, 149, 154, 157), size: 30),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      splashColor: const Color.fromARGB(255, 144, 147, 150),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.camera_alt_outlined,
                          color: Color.fromARGB(255, 149, 154, 157), size: 30),
                    ),
                  ],
                )),
            Container(
              height: height * 0.25,
              width: height * 0.25,
              margin: EdgeInsets.only(top: height * 0.18),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: Card(
                color: const Color.fromARGB(200, 24, 143, 71),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: (imageimport1 == null)
                    ? null
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(File((imageimport1.path))),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createpdf() async {
    PdfDocument document = PdfDocument();

    document.pageSettings.margins.all = 50;
    document.pageSettings.orientation = PdfPageOrientation.landscape;

    PdfPage page = document.pages.add();

    PdfGrid grid = PdfGrid();

//Add columns to grid
    grid.columns.add(count: 2);

//Add rows to grid
    PdfGridRow row1 = grid.rows.add();
    row1.cells[0].value = 'summary'.tr;

    PdfGridRow row3 = grid.rows.add();
    row3.cells[0].value = 'type'.tr;
    row3.cells[1].value = name;

    PdfGridRow row4 = grid.rows.add();
    row4.cells[0].value = 'Accuracy'.tr;
    row4.cells[1].value = confidence;

    PdfGridRow row5 = grid.rows.add();
    row5.cells[0].value = 'About' + name + '\n' + detail;

//Set the row span
    row1.cells[0].columnSpan = 2;
    row5.cells[0].columnSpan = 2;

    row1.height = 60;
    row3.height = 50;
    row4.height = 50;

//Set the row height

//Set the row style
    row1.style = PdfGridRowStyle(
        backgroundBrush: PdfBrushes.lightGray,
        textPen: PdfPens.darkGreen,
        textBrush: PdfBrushes.darkGreen,
        font: PdfStandardFont(PdfFontFamily.timesRoman, 30));

    row3.style = PdfGridCellStyle(
      textPen: PdfPens.black,
      font: PdfStandardFont(PdfFontFamily.helvetica, 20),
    );

    row4.style = PdfGridCellStyle(
        textPen: PdfPens.black,
        font: PdfStandardFont(PdfFontFamily.helvetica, 20));

    row5.style = PdfGridCellStyle(
        textPen: PdfPens.black,
        font: PdfStandardFont(PdfFontFamily.helvetica, 20));
//Draw the grid in PDF document page
    PdfLayoutFormat layoutFormat =
        PdfLayoutFormat(layoutType: PdfLayoutType.paginate);

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 700, 600));

    grid.style.cellPadding = PdfPaddings(left: 2, right: 2, top: 2, bottom: 2);

    List<int> bytes = document.save();
    document.dispose();

    saveAndOpenFile(bytes, 'Report.pdf');
  }

  void detailAssign(name) {
    if (name == 'HealthyApple') {
      setState(() {
        detail = 'healthyapple'.tr;
      });
    } else if (name == 'ScabApple') {
      setState(() {
        detail = 'scab'.tr;
      });
    } else if (name == 'RotApple') {
      setState(() {
        detail = 'rot'.tr;
      });
    } else if (name == 'HealthyCitrus') {
      setState(() {
        detail = 'healthycitrus'.tr;
      });
    } else if (name == 'ScabCitrus') {
      setState(() {
        detail = 'scabcitrus'.tr;
      });
    } else {
      setState(() {
        detail = 'spot'.tr;
      });
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            infoDisplay(imageFile: imageimport1, detail: detail, name: name)));
  }
}
