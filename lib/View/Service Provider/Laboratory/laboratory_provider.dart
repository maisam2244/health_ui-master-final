import 'package:flutter/material.dart';
import 'package:health/Resources/AppBar/app_bar.dart';
import 'package:health/Resources/Requests/provider_completed_reqs.dart';
import 'package:health/Resources/Requests/provider_requests.dart';
import 'package:health/Resources/Search_bar/search_bar.dart';

class Laboratory_Provider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Laboratory Service Provider",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              MySearchBar(),
              
              SizedBox(height: 20),

              Provider_Requests(),

              Provider_Completed_Requests()

            ],
          ),
        ),
      ),
    );
  }
}