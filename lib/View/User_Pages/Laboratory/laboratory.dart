import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Laboratory extends StatefulWidget {
  const Laboratory({super.key});

  @override
  State<Laboratory> createState() => _LaboratoryState();
}

class _LaboratoryState extends State<Laboratory> {
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
          // GoogleMapController controller = await _controller.future;
          // controller.animateCamera(CameraUpdate.newCameraPosition(
          //   CameraPosition(target: LatLng(24.8846, 67.1754), zoom: 14.4746),
          // ));
          // setState(() {});

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
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class Laboratory extends StatefulWidget {
//   const Laboratory({Key? key}) : super(key: key);

//   @override
//   _LocationWidgetState createState() => _LocationWidgetState();
// }

// class _LocationWidgetState extends State<Laboratory> {
//   Position? position;

//   fetchPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     Position currentposition = await Geolocator.getCurrentPosition();
//     setState(() {
//       position = currentposition;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Location')),
//       body: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Text(position == null ? 'Location' : position.toString()),
//         ElevatedButton(
//             onPressed: () => fetchPosition(), child: Text('Find Location'))
//       ])),
//     );
//   }
// }
