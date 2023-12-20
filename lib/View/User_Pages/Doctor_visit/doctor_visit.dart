import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorVisit extends StatefulWidget {
  const DoctorVisit({super.key});

  @override
  State<DoctorVisit> createState() => _DoctorVisitState();
}

class _DoctorVisitState extends State<DoctorVisit> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(24.8846, 67.1754),
    zoom: 14.4746,
  );
  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(24.8846, 70.1754),
        infoWindow: InfoWindow(title: "Current Location"))
  ];
  String stAddress = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {});
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: kGooglePlex,
          markers: Set<Marker>.of(_marker),
          myLocationEnabled: true,
          compassEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            print("My Location");
            print(value.latitude.toString() + " " + value.longitude.toString());
            _marker.add(Marker(
                markerId: MarkerId("2"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: "My Location")));
            CameraPosition cameraPosition = CameraPosition(
                zoom: 14,
                target: LatLng(
                  value.latitude,
                  value.longitude,
                ));
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
          stAddress = getUserCurrentLocation().toString();
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
