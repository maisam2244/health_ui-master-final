// ignore_for_file: unused_import

import 'package:file_picker/file_picker.dart' as FilePicker;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppBar/Providers_available/provider_available.dart';
import 'package:health/View/Provider_services/Result_upload/result_upload.dart';
import 'package:health/View/Provider_services/Users_requests/user_requests.dart';
import 'package:health/View/Service%20Provider/Doctor_Visit/doctor_visit_provider.dart';
import 'package:health/View/Service%20Provider/Provider_home/service_provider_home.dart';
import 'package:health/View/Splash_Screen/splash_screen.dart';
import 'package:health/View/User_Authentication/Login_page.dart';
import 'package:health/View/User_Pages/Doctor_visit/doctor_visit.dart';
import 'package:health/View/User_Pages/Home_page/home_page.dart';
import 'package:health/View/User_services/Contact_us/user_contact_us.dart';
import 'package:health/ViewModel/Localization/localization.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FilePicker.PlatformFile;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash_Screen(),
      debugShowCheckedModeBanner: false,
      locale: Locale("en", "US"),
      fallbackLocale: Locale("en", "US"),
      translations: Language(),
    );
  }
}
