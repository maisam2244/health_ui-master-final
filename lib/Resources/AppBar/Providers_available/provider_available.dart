import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';
import 'package:health/View/User_Pages/Doctor_visit/doctor_visit.dart';

class UserPackages extends StatefulWidget {
  @override
  State<UserPackages> createState() => _UserPackagesState();
}

class _UserPackagesState extends State<UserPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MySearchBar(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Packages",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildListTile("تحلیل صورتہ الدم  ", "ابتدا من 60 ریال",
                      Icons.science_outlined),
                  buildListTile("فحص فیتامین ب 12", "ابتدا من 120 ریال",
                      Icons.science_outlined),
                  buildListTile("فحص الحرمون", "ابتدا من 180 ریال",
                      Icons.science_outlined),
                  buildListTile("تحلیل السکر التراکمی", "ابتدا من 60 ریال",
                      Icons.science_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Expanded(
        child: ListTile(
          onTap: () {
            Get.defaultDialog(
              title: "يتأكد؟",
              //get my location
              textCancel: "يلغي",
              middleText: "",
              textConfirm: "الحصول على الموق",
              onCancel: () {
                Navigator.pop(context);
              },
              onConfirm: () {
                Get.to(() => DoctorVisit());
              },
            );
          },
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          trailing: Icon(icon, color: Colors.black),
          tileColor: Colors.lightBlue.shade50,
        ),
      ),
    );
  }
}
