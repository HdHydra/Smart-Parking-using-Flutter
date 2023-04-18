import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:model/widgets/drawer.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';

import '../values/constants.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final database = FirebaseDatabase.instance.ref();
  List<LocationAccuracy> accuracy = [
    LocationAccuracy.low,
    LocationAccuracy.medium,
    LocationAccuracy.high
  ];
  late LocationAccuracy currentAccuracy;
  List<String> accuracyMode = ["Low", "Medium", "High"];
  String currentMode = "High";
  int choice = 2;
  final GlobalKey _globalKey = GlobalKey();
  Position? _currentPosition;
  var saved = 0;

  @override
  void initState() {
    super.initState();
    makeSlots();
    setState(() {
      currentAccuracy = accuracy[choice];
    });
    // initBackgroundFetch();
    _locationPermission();
  }

  Future _locationPermission() async {
    PermissionStatus permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      await _getLocationStream();
    } else {
      setState(() async {
        await Permission.location.request();
      });
      _locationPermission();
    }
  }

  Future _getLocationStream() async {
    print('start');
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationRef = database.child('/location');
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context); // pop the current page
        return false; // return false to prevent the default back button behavior
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.pink[900],
          title: const Text('Find My Location'),
          actions: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      choice = (choice + 1) % 3;
                      currentAccuracy = accuracy[choice];
                      currentMode = accuracyMode[choice];
                      locationRef
                          .child('slots')
                          .set(currentMode)
                          .then((_) => print('successful'))
                          .catchError((error) => print('error caught $error'));
                    });
                  },
                  child: Text(currentMode),
                )
              ],
            )
          ],
        ),
        drawer: MyDrawer(),
        body: RepaintBoundary(
          key: _globalKey,
          child: _currentPosition == null
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                  options: MapOptions(
                    center: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    interactiveFlags: InteractiveFlag.drag |
                        InteractiveFlag.pinchZoom |
                        InteractiveFlag.doubleTapZoom,
                    zoom: 16.0,
                    minZoom: 8,
                    maxZoom: 21,
                  ),
                  children: [
                    RepaintBoundary(
                      child: TileLayer(
                        maxNativeZoom: 18,
                        maxZoom: 20,
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.model',
                        retinaMode:
                            MediaQuery.of(context).devicePixelRatio > 1.0,
                      ),
                    ),
                    RepaintBoundary(
                      child: PolygonLayer(
                        polygonCulling: false,
                        polygons:
                            polygonSlotsCoordinates.asMap().entries.map((entry) {
                          int index = entry.key;
                          List<LatLng> coordinates = entry.value;
                          Color color =
                              polygonColors[index % polygonColors.length];
                          return Polygon(
                            points: coordinates,
                            color: color,
                            isFilled: true,
                            label: '${entry.key}',
                            borderColor: Colors.black,
                            borderStrokeWidth: 0.2,
                          );
                        }).toList(),
                      ),
                    ),
                    RepaintBoundary(
                      child: MarkerLayer(
                        markers: [
                          Marker(
                            // width: 80.0,
                            // height: 80.0,
                            anchorPos: AnchorPos.align(AnchorAlign.top),
                            point: LatLng(
                              _currentPosition!.latitude,
                              _currentPosition!.longitude,
                            ),
                            builder: (ctx) => const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
