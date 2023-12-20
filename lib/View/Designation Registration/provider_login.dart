import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:health/Resources/Button/mybutton.dart';
import 'package:health/Resources/TextField/MyTextField.dart';
import 'package:health/Resources/Utils/utils.dart';
import 'package:health/View/Designation%20Registration/designation.dart';
import 'package:health/View/Service%20Provider/Provider_home/service_provider_home.dart';
import 'package:health/View/User_Authentication/register_page.dart';
import 'package:health/View/User_Pages/Home_page/home_page.dart';
import 'package:flutter/material.dart';

class Provider_login extends StatefulWidget {
  const Provider_login({super.key});

  @override
  State<Provider_login> createState() => _Provider_loginState();
}

class _Provider_loginState extends State<Provider_login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/logo/harees_logo.png"))),
            const SizedBox(
              height: 40,
            ),
            Form(
                key: _FormKey,
                child: Column(children: [
                  MyTextField(
                      controller: emailController,
                      obscureText: false,
                      labelText: "Email",
                      conditionText: "Email cannot be empty"),
                  MyTextField(
                      controller: passwordController,
                      obscureText: true,
                      labelText: "Password",
                      conditionText: "Password cannot be empty"),
                ])),
            const SizedBox(height: 50),
            RoundButton(
                text: "Login",
                onTap: () {
                  if (_FormKey.currentState!.validate()) {
                    _auth
                        .signInWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString())
                        .then((value) {
                      Utils().toastMessage(value.user!.email.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Service_Provider_Home()));
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a provier?",
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Designation()));
                    },
                    child: const Text("register now",
                        style: TextStyle(fontSize: 20)))
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
