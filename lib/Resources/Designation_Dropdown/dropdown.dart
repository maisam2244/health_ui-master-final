import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String selectedService = 'Your Designation';

  List<String> services = [
    'Your Designation',
    'Laboratory',
    'Nurse visit',
    'Vitamin IV Drops and Fluids',
    'Doctor Visit',
    'Virtual Consultation',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty || value == 'Your Designation') {
            return "Please Select Your Designation";
          }
          return null;
        },
        value: selectedService,
        onChanged: (value) {
          setState(() {
            selectedService = value!;
          });
        },
        items: services.map((service) {
          return DropdownMenuItem<String>(
            value: service,
            child: Text(service),
          );
        }).toList(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: "Select a Service",
        ),
      ),
    );
  }
}
