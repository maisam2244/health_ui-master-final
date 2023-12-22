import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/View/Accepted_appointments/accepted_appointments.dart';
import 'package:health/View/Provider_services/About_us/about_us.dart';
import 'package:health/View/Provider_services/Accepted_requests/accepted_requests.dart';
import 'package:health/View/Provider_services/Result_upload/result_upload.dart';
import 'package:health/View/User_services/Results/results.dart';
import 'package:health/View/User_services/User_appointments/User_appointments.dart';
import 'package:get/get.dart';

import '../../View/Provider_services/Users_requests/user_requests.dart';

class UserGridServices extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const UserGridServices({
    Key? key,
    required this.serviceIcon,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(serviceIcon, size: 40),
          onPressed: onPressed,
          color: Colors.green,
        ),
        SizedBox(height: 5),
        Text(
          serviceName,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class UserServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        UserGridServices(
          serviceIcon: Icons.calendar_month_outlined,
          serviceName: "Appointments",
          onPressed: () {
            Get.to(() => MyAppointments());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Accepted Appointments",
          onPressed: () {
            Get.to(() => AcceptedRequests());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.list_alt,
          serviceName: "See result",
          onPressed: () {
            Get.to(() => UserResult());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.message_outlined,
          serviceName: "Contact Us",
          onPressed: () {},
        ),
        UserGridServices(
          serviceIcon: Icons.family_restroom,
          serviceName: "Family",
          onPressed: () {},
        ),
        UserGridServices(
          serviceIcon: Icons.info,
          serviceName: "About us",
          onPressed: () {
            Get.to(() => AboutUsPage());
          },
        ),
      ],
    );
  }
}
