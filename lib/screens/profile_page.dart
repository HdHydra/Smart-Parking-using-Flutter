import 'dart:async';

import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:easy_geofencing/enums/geofence_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:model/screens/add_vehicle.dart';
import 'package:model/values/constants.dart';
import 'package:model/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool reserved = false;

  StreamSubscription<GeofenceStatus>? geofenceStatusStream;
  String geofenceStatus = '';
  setGeofencing() async {
    if (geofenceStatusStream == null) {
      EasyGeofencing.startGeofenceService(
          pointedLatitude: "10.8243504",
          pointedLongitude: "76.6424552",
          radiusMeter: "250",
          eventPeriodInSeconds: 10);

      geofenceStatusStream = EasyGeofencing.getGeofenceStream()!.listen(
        (GeofenceStatus status) {
          geoStatus = '$status';
          print(pslot);
          if (pslot != "" && toastRes != 0) {
            toastRes = 0;
          }
          if (pslot != "") {
            if (geoStatus == 'GeofenceStatus.enter') {
              toast("Slot $pslot is reserved for you!");
              setState(() {
                reserved = true;
                slotNames[pslot] = 2;
              });
            }
          } else {
            if (reserved && slotNames[pslot] == 2) {
              toast("Slot $pslot has been freed!");
              setState(() {
                reserved = false;
              });
            }
            slotNames[pslot] = 0;
          }
        },
      );
    }
  }

  bool isChecked = false;
  var userName;
  late int noVehicles = 0;

  @override
  void initState() {
    super.initState();
    fetchUserData();
    if (geofenceStatusStream == null) {
      setGeofencing();
    }
  }

  void fetchUserData() async {
    final snapshot = await _db
        .collection('vehicles')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    final int length = snapshot.docs.length;
    final String? name = FirebaseAuth.instance.currentUser?.displayName;
    setState(() {
      noVehicles = length;
      userName = name;
    });
  }

  toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.person_rounded,
                size: 80,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$userName",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      'Number of Vehicles: $noVehicles',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StreamBuilder(
            stream: _db
                .collection('vehicles')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...');
              }
              final documents = snapshot.data?.docs;

              return ListView.builder(
                shrinkWrap: true,
                itemExtent: 80.0,
                itemCount: documents?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: (documents?[index]['type'] == 'bike')
                        ? const Icon(Icons.pedal_bike)
                        : const Icon(Icons.directions_car_sharp),
                    title: Text(documents?[index]['name']),
                    trailing: Text(
                        "${documents?[index]['vehicle_no']} (${documents?[index]['prefered_slot']})"),
                    subtitle: Text(documents?[index]['type']),
                    onTap: () {
                      toast(
                          "Your ${documents?[index]['name']} prefers slot ${documents?[index]['prefered_slot']}");
                      slotNames[pslot] = 0;
                      pslot = documents?[index]['prefered_slot'];
                      toastRes = 1;
                    },
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddVehicle(1)));
                },
                icon: const Icon(Icons.directions_car_sharp),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddVehicle(0)));
                },
                icon: const Icon(Icons.pedal_bike),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
