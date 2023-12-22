// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
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

class Service_Provider_Home extends StatefulWidget {
  Service_Provider_Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Service_Provider_Home> createState() => _Service_Provider_HomeState();
}

class _Service_Provider_HomeState extends State<Service_Provider_Home> {
  final _auth = FirebaseAuth.instance;
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appointments").snapshots();

  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appointments");

  final CollectionReference user_appointment_delete =
      FirebaseFirestore.instance.collection("User_appointments");

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    final accepted_appointments_list = accepted_appointments
        .doc(user!.email)
        .collection("accepted_appointments_list")
        .snapshots();
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
      body: ListView(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
          // Slider_Provider(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Services:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MoreServicesGrid(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your accepted requests:",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: accepted_appointments_list,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          snapshot.data!.docs[index]['email'].toString(),
                          style:
                              TextStyle(color: Colors.blue[700], fontSize: 16),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.docs[index]['address'].toString(),
                              style: TextStyle(color: Colors.green[800]),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data!.docs[index]["type"].toString(),
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          ],
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.blue[700],
                          size: 40,
                        ),
                        trailing: Icon(
                          Icons.medical_services,
                          size: 35,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
