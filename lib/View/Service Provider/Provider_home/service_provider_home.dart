// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/Crousal_slider/slider_provider.dart';
import 'package:health/Resources/Drawer/drawer.dart';
import 'package:health/Resources/Requests/provider_requests.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';
import 'package:health/Resources/Services_gri/services_grid.dart';
import 'package:health/View/Designation%20Registration/provider_login.dart';
import 'package:health/View/Splash_Screen/splash_screen.dart';

class Service_Provider_Home extends StatelessWidget {
  Service_Provider_Home({
    Key? key,
  }) : super(key: key);
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      endDrawer: MyDrawer(
        ontap: () {
          _auth.signOut().then((value) {
            Get.to(() => Splash_Screen());
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
              // Slider_Provider(),
              SizedBox(height: 20),
              Text(
                'Services:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MoreServicesGrid(),
              Provider_Requests()
            ],
          ),
        ),
      ),
    );
  }
}
