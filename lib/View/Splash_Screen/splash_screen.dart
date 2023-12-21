// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/View/Designation%20Registration/designation.dart';
import 'package:health/View/Designation%20Registration/provider_login.dart';
import 'package:health/View/User_Authentication/Login_page.dart';
import 'package:health/View/User_Pages/Home_page/home_page.dart';
import 'package:health/ViewModel/Splash_Screen_Service/splash_services.dart';

class Splash_Screen extends StatefulWidget {
  Splash_Screen({
    Key? key,
  }) : super(key: key);
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final splashServices = SplashServices();
    // splashServices.splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 140,
              backgroundImage: AssetImage("assets/logo/harees_logo.png"),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
              child: Text(
            "Harees ",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 30,
          ),
          RoundButton(
              text: "Join as a user",
              onTap: () {
                Get.to(() => LoginScreen());
              }),
          SizedBox(
            height: 10,
          ),
          RoundButton(
              text: "Join as a provider",
              onTap: () {
                Get.to(() => Provider_login());
              })
        ],
      ),
    ));
  }
}
