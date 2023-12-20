import 'package:flutter/material.dart';
import 'package:health/Resources/AppColors/app_colors.dart';

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
          onPressed: () {},
        ),
        ServiceIconButton(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Packages",
          onPressed: () {},
        ),
        ServiceIconButton(
          serviceIcon: Icons.list_alt,
          serviceName: "Requests",
          onPressed: () {},
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
      ],
    );
  }
}
