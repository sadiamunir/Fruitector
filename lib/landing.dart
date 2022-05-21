import 'package:flutter/material.dart';
import 'package:fruitector/camera.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CameraScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 214, 180, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 100),
            Text(
              'easy'.tr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Patrick_Hand',
              ),
            ),
            Text(
              'with'.tr,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Patrick_Hand',
              ),
            ),
            Text(
              'fruitector'.tr,
              style: TextStyle(
                  fontSize: 45.0,
                  color: Color.fromRGBO(14, 82, 41, 1),
                  fontFamily: 'Permanent_Marker'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 60.0,
                    margin: const EdgeInsets.only(left: 50.0, top: 150),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(2, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      child: SizedBox(
                        height: 50.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 24, 143, 71), // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            _navigateToNextScreen(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'start'.tr,
                                style: TextStyle(
                                  fontFamily: 'Patrick_Hand',
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: 350,
                        margin: const EdgeInsets.only(top: 310),
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(130, 40)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.18),
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 350.0,
                        width: 350.0,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(right: 35.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.asset('images/farmer.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
