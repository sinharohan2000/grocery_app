import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  static const id = 'map_screen';

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController _mapController;
  final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(27.702610, 85.288072));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Map',
          ),
          leading: Icon(
            Icons.map,
          )),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.terrain,
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },
        onTap: (coordinate) {
          _mapController.animateCamera(CameraUpdate.newLatLng(coordinate));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.animateCamera(CameraUpdate.zoomIn());
        },
        child: Icon(
          Icons.zoom_in,
        ),
      ),
    );
  }
}
