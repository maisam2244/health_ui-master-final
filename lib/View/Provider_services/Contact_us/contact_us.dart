import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/Resources/Button/mybutton.dart';

class ProviderContact extends StatelessWidget {
  ProviderContact({super.key});
  final _auth = FirebaseAuth.instance;
  final _fireStore =
      FirebaseFirestore.instance.collection("Provider_contact_us");
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
                controller: message,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your message',
                )),
          ),
          Center(
            child: RoundButton(
                text: "Submit",
                onTap: () {
                  _fireStore
                      .doc(user!.email)
                      .set({"email": user!.email, 'message': message.text});
                }),
          )
        ],
      ),
    );
  }
}
