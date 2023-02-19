import 'package:assignment_cloudcraftz/app/constants/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _screenshotController = ScreenshotController();

  Future<Image>? image;

  Future<String> get imagePath async {
    final directory = (await getApplicationDocumentsDirectory()).path;
    return '$directory/qr.png';
  }

  Future<void> _captureAndSaveQRCode(BuildContext context) async {
    final imageDirectory = await imagePath;

    _screenshotController.captureAndSave(imageDirectory).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'QR Saved',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        });
  }

// void handleScannedData(String data) async {

//   // Create a contact URL with the contact details pre-filled
//   final url = 'contact://new?givenName=$firstName&familyName=$lastName&phone=$workPhone&email=$workEmail';

//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logo/logo.png',
            fit: BoxFit.cover,
            height: kToolbarHeight,
          ),
          centerTitle: true,
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Your QR code is generated',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Screenshot(
                      controller: _screenshotController,
                      child: QrImage(
                        data: data.toString(),
                        version: QrVersions.auto,
                        size: 300.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(R.primaryColor),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: const BorderSide(color: Colors.white))),
                        ),
                        onPressed: () => Get.offAllNamed('/init'),
                        child: const Text(
                          'Restart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side:
                                          const BorderSide(color: Colors.red))),
                        ),
                        onPressed: () => _captureAndSaveQRCode(context),
                        child: const Text(
                          'Download',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
