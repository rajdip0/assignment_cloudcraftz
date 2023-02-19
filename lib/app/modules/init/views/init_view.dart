import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/init_controller.dart';

class InitView extends GetView<InitController> {
  const InitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset("assets/logo/logo.png",
              // color: Colors.white,
              width: 250,
              fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Welcome to QR generater",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We are excited to offer you a quick and easy way to create and download custom QR codes for your business card.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We do not save your personal information and respect our users' privacy.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(color: Colors.red))),
              ),
              onPressed: () => Get.toNamed("form"),
              child: const Text(
                "Get started",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        )
      ],
    ));
  }
}
