// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class DoctorRequests extends StatefulWidget {
  DoctorRequests({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorRequests> createState() => _DoctorRequestsState();
}

class _DoctorRequestsState extends State<DoctorRequests> {
  final user_appointments =
      FirebaseFirestore.instance.collection("User_appointments").snapshots();

  final accepted_appointments =
      FirebaseFirestore.instance.collection("Accepted_appointments");

  final CollectionReference user_appointment_delete =
      FirebaseFirestore.instance.collection("User_appointments");
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MySearchBar(),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: user_appointments,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              snapshot.data!.docs[index]['email'].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.docs[index]['address']
                                      .toString(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(snapshot.data!.docs[index]["type"]
                                    .toString()),
                              ],
                            ),
                            leading: Icon(Icons.star),
                            trailing: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                  title: 'Accept Appointment',
                                  middleText: "Are you sure?",
                                  textConfirm: 'Yes',
                                  textCancel: 'No',
                                  onConfirm: () async {
                                    try {
                                      String email = snapshot
                                          .data!.docs[index]['email']
                                          .toString();
                                      String address = snapshot
                                          .data!.docs[index]['address']
                                          .toString();

                                      if (user != null) {
                                        // User is not null, safe to access properties
                                        await accepted_appointments
                                            .doc(user.email)
                                            .collection(
                                                "accepted_appointments_list")
                                            .add({
                                          'email': email,
                                          'address': address,
                                        });

                                        Navigator.pop(context);
                                      } else {
                                        // Handle the case where user is null
                                        print('User is null');
                                      }
                                    } catch (e) {
                                      print('Error accepting appointment: $e');
                                    }
                                  },
                                  onCancel: () {
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              child: Icon(Icons.chevron_right),
                            ),
                            onTap: () {
                              // print('Item $index tapped');
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
