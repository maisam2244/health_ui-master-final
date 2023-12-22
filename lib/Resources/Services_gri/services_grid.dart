import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/Resources/AppColors/app_colors.dart';
import 'package:health/View/Accepted_appointments/accepted_appointments.dart';
import 'package:health/View/Provider_services/About_us/about_us.dart';
import 'package:health/View/Provider_services/Accepted_requests/accepted_requests.dart';
import 'package:health/View/Provider_services/Result_upload/result_upload.dart';

import '../../View/Provider_services/Users_requests/user_requests.dart';

class ServiceIconButton extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const ServiceIconButton({
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

class MoreServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ServiceIconButton(
          serviceIcon: Icons.calendar_month_outlined,
          serviceName: "Appointments",
          onPressed: () {
            Get.to(() => UserRequests());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Accepted Appointments",
          onPressed: () {
            Get.to(() => AcceptedRequests());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.list_alt,
          serviceName: "Upload Results",
          onPressed: () {
            Get.to(() => ResultUpload());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.message_outlined,
          serviceName: "Contact Us",
          onPressed: () {},
        ),
        ServiceIconButton(
          serviceIcon: Icons.family_restroom,
          serviceName: "Family",
          onPressed: () {},
        ),
        ServiceIconButton(
          serviceIcon: Icons.info,
          serviceName: "About Us",
          onPressed: () {
            Get.to(() => AboutUsPage());
          },
        ),
      ],
    );
  }
}
