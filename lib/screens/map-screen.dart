import 'package:groceryapp/export.dart';

class MapsScreen extends StatefulWidget {
  static const id = 'map_screen';

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController _mapController;
  var currentLocation;
  double newLatitude;
  double newLongitude;
  bool mapToggle = false;

  @override
  void initState() {
    super.initState();
    try {
      Geolocator.getCurrentPosition().then((currloc) {
        setState(() {
          currentLocation = currloc;
          mapToggle = true;
          getLocation();
          mapToggle = true;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    newLatitude = location.latitude;
    print(newLatitude);
    newLongitude = location.longitude;
    print(newLongitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Icon(
              Icons.map,
            ),
            Text(
              '      Map',
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: DrawerUI(),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 80.0,
                width: double.infinity,
                child: mapToggle
                    ? GoogleMap(
                        onMapCreated: (controller) {
                          setState(() {
                            _mapController = controller;
                            getLocation();
                          });
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(26.7026143, 85.288129),
                          zoom: 10.0,
                        ),
                        compassEnabled: true,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        onTap: (coordinate) {
                          _mapController.animateCamera(
                              CameraUpdate.newLatLng(coordinate));
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
              )
            ],
          )
        ],
      ),

    );
  }
}