import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:model/menu/drawer.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<LocationAccuracy> accuracy = [
    LocationAccuracy.low,
    LocationAccuracy.medium,
    LocationAccuracy.high
  ];
  late LocationAccuracy currentAccuracy;
  List<String> accuracyMode = ["Low", "Medium", "High"];
  String currentMode = "Medium";
  int choice = 0;
  final GlobalKey _globalKey = GlobalKey();
  Position? _currentPosition;
  var saved = 0;
  List<List<LatLng>> polygons = [
    [
      LatLng(10.82346691, 76.64191132),
      LatLng(10.82336177, 76.64234197),
      LatLng(10.82339871, 76.64190508),
      LatLng(10.82346691, 76.64191132)
    ],
    [
      LatLng(10.82332156, 76.64334505),
      LatLng(10.82326191, 76.64333840),
      LatLng(10.82331911, 76.64265540),
      LatLng(10.82338039, 76.64265540),
    ],
    [
      LatLng(10.82355446, 76.64169178),
      LatLng(10.82361117, 76.64169609),
      LatLng(10.82356712, 76.64233982),
      LatLng(10.82351072, 76.64233631),
    ],
    [
      LatLng(10.82406636, 76.64168289),
      LatLng(10.82398465, 76.64201898),
      LatLng(10.82394543, 76.64200900),
      LatLng(10.82402387, 76.64166958),
    ],
    [
      LatLng(10.82393235, 76.64237837),
      LatLng(10.82385391, 76.64247154),
      LatLng(10.82382123, 76.64243827),
      LatLng(10.82389313, 76.64235175),
    ],
    [
      LatLng(10.82412846, 76.64203229),
      LatLng(10.82399772, 76.64222530),
      LatLng(10.82397158, 76.64218537),
      LatLng(10.82408270, 76.64199236),
    ],
    [
      LatLng(10.82443901, 76.64201756),
      LatLng(10.82443671, 76.64205975),
      LatLng(10.82428017, 76.64204451),
      LatLng(10.82428247, 76.64199881),
    ],
    [
      LatLng(10.82409864, 76.64137955),
      LatLng(10.82406432, 76.64161540),
      LatLng(10.82402755, 76.64161665),
      LatLng(10.82406187, 76.64137955),
    ],
    [
      LatLng(10.82415149, 76.64185199),
      LatLng(10.82412107, 76.64191394),
      LatLng(10.82407924, 76.64190232),
      LatLng(10.82410206, 76.64185199),
    ],
    [
      LatLng(10.82423515, 76.64120929),
      LatLng(10.82421614, 76.64124026),
      LatLng(10.82420093, 76.64124413),
      LatLng(10.82420473, 76.64120154),
    ],
    [
      LatLng(10.82414521, 76.64118364),
      LatLng(10.82414031, 76.64122482),
      LatLng(10.82408148, 76.64121484),
      LatLng(10.82408760, 76.64118239),
    ],
    [
      LatLng(10.82418192, 76.64160033),
      LatLng(10.82415530, 76.64174358),
      LatLng(10.82411727, 76.64174745),
      LatLng(10.82415149, 76.64160033),
    ],
    [
      LatLng(10.82500713, 76.64368814),
      LatLng(10.82500142, 76.64374186),
      LatLng(10.82492869, 76.64373606),
      LatLng(10.82493440, 76.64368379),
    ],
    [
      LatLng(10.82476327, 76.64368379),
      LatLng(10.82475614, 76.64374186),
      LatLng(10.82466915, 76.64374332),
      LatLng(10.82467200, 76.64367798),
    ],
    [
      LatLng(10.82502852, 76.64333243),
      LatLng(10.82502424, 76.64339196),
      LatLng(10.82496720, 76.64339051),
      LatLng(10.82497575, 76.64332662),
    ],
    [
      LatLng(10.82400461, 76.64334550),
      LatLng(10.82400033, 76.64339631),
      LatLng(10.82381637, 76.64337744),
      LatLng(10.82382065, 76.64332662),
    ],
  ];

  // List<enum> accuracy =;

  // List<LatLng> points = [LatLng(0, 0)];

  @override
  void initState() {
    super.initState();
    setState(() {
      currentAccuracy = accuracy[1];
    });
    // initBackgroundFetch();
    _locationPermission();
  }

  Future _locationPermission() async {
    PermissionStatus permission = await Permission.location.status;
    if (permission == PermissionStatus.granted) {
      await _checkLocationPermission();
    } else {
      setState(() async {
        await Permission.location.request();
      });
      _locationPermission();
    }
  }
  // Future<void> initBackgroundFetch() async {
  //   BackgroundFetch.configure(
  //     BackgroundFetchConfig(
  //       minimumFetchInterval: 15, // fetch the location every 15 minutes
  //       stopOnTerminate: false, // continue running the task even if the app is terminated
  //       enableHeadless: true, // run the task in the background
  //       startOnBoot: true, // start the task when the device boots
  //     ),
  //         (String taskId) async {
  //       // fetch the user's location and do something with it
  //       Position position = await Geolocator.getCurrentPosition();
  //       print('Location: ${position.latitude}, ${position.longitude}');
  //       BackgroundFetch.finish(taskId);
  //     },
  //   );
  // }

  Future _checkLocationPermission() async {
    // PermissionStatus permission = await Permission.location.status;
    // if (permission == PermissionStatus.granted) {
    print('start');
    await Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });

    // }
    // catch (e) {
    //   Geolocator.getPositionStream(
    //     locationSettings: const LocationSettings(
    //       accuracy: LocationAccuracy.high,
    //       distanceFilter: 10,
    //     ),
    //   ).listen((Position position) {
    //     setState(() {
    //       _currentPosition = position;
    //       // points.add(
    //       //     LatLng(_currentPosition!.latitude, _currentPosition!.longitude));
    //       //print('high mode');
    //     });
    //   });
    // }
    // }
    // else {
    //   setState(() async {
    //     // await Permission.location.request();
    //     PermissionStatus permissionResult = await Permission.location.request();
    //     if (permissionResult == PermissionStatus.granted) {
    //       _checkLocationPermission();
    //     }
    //   });
    // _checkLocationPermission();
    // Future.delayed(Duration(seconds: 3), () async {await _checkLocationPermission();});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context); // pop the current page
        return false; // return false to prevent the default back button behavior
      },
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.pink[900],
          title: Text('Find My Location'),
          actions: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      choice = (choice + 1) % 3;
                      currentAccuracy = accuracy[choice];
                      currentMode = accuracyMode[choice];
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
              ? Center(child: CircularProgressIndicator())
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
                    // zoomDuration: const Duration(milliseconds: 5000),
                    maxZoom: 17.49999,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.model',
                      retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
                    ),
                    RepaintBoundary(
                      child: PolygonLayer(
                        polygonCulling: false,
                        polygons: [
                          Polygon(
                            points: polygons[0],
                            label: 'A',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[1],
                            label: 'B',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[2],
                            label: 'C',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[3],
                            label: 'D',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[4],
                            label: 'E',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[5],
                            label: 'F',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[6],
                            label: 'G',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[7],
                            label: 'H',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[8],
                            label: 'I',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[9],
                            label: 'J',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[10],
                            label: 'K',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[11],
                            label: 'L',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[12],
                            label: 'M',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[13],
                            label: 'N',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[14],
                            label: 'O',
                            color: Colors.blue,
                          ),
                          Polygon(
                            points: polygons[15],
                            label: 'P',
                            color: Colors.blue,
                          ),
                        ],
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
                            builder: (ctx) => Container(
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                              ),
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
