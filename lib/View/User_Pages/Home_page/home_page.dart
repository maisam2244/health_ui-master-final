import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/Crousal_slider/slider_user.dart';
import 'package:health/Resources/Drawer/drawer.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';
import 'package:health/Resources/Requests/user_requests.dart';
import 'package:health/Resources/Services_gri/services_grid.dart';
import 'package:health/View/User_Authentication/Login_page.dart';

class HomePage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      endDrawer: MyDrawer(
        ontap: () {
          _auth.signOut().then((value) {
            Get.to(() => LoginScreen());
          });
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MySearchBar(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our Services:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CarouselExample(),
              SizedBox(height: 20),
              Text(
                'Other Services:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MoreServicesGrid(),
              Requests()
            ],
          ),
        ),
      ),
    );
  }
}
