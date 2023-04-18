import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:model/screens/add_vehicle.dart';
import 'package:model/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var userName;
  late int noVehicles = 0;

  @override
  void initState() {
    super.initState();
    // fetchUserData();
    // setState(() async {
    //   final snapshot = await _db.collection('vehicles').get();
    //   noVehicles = snapshot.docs.length;
    //   userName = FirebaseAuth.instance.currentUser?.displayName;
    //   noVehicles;
    // });
  }

  void fetchUserData() async {
    final snapshot = await _db.collection('vehicles').where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
    final int length = snapshot.docs.length;
    final String? name = FirebaseAuth.instance.currentUser?.displayName;
    setState(() {
      noVehicles = length;
      userName = name;
    });
  }

  // Future<int> getCollectionLength(String collectionName) async {
  //   final snapshot = await _db.collection(collectionName).get();
  //   final length = snapshot.docs.length;
  //   return length;
  // }

  // Widget _buildListItem(BuildContext context, VehicleInfo  vehicleInfo) {
  //   return ListTile(
  //     title: Row(
  //       children: [
  //         Expanded(child:Text(vehicleInfo.name)),

  //       ],
  //     )
  //   )
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Page'),
        ),
        drawer: MyDrawer(),
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
                      "${userName}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        'Number of Vehicles: ${noVehicles}',
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
              stream: _db.collection('vehicles').where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading...');
                }
                final documents = snapshot.data?.docs;
                fetchUserData();

                return ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 80.0,
                  itemCount: documents?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: (documents?[index]['type'] == 'bike')
                          ? Icon(Icons.pedal_bike)
                          : Icon(Icons.directions_car_sharp),
                      title: Text(documents?[index]['name']),
                      trailing: Text(documents?[index]['vehicle_no']),
                      subtitle: Text(documents?[index]['type']),
                    );
                  },
                );
              },
            ),
            SizedBox(
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

            // ListView(
            //   itemExtent: 100.0,
            //   children: [
            //     ListTile(
            //       leading: const Icon(
            //         Icons.directions_car_sharp,
            //         size: 40,
            //       ),
            //       title: const Text("Cars"),
            //       subtitle: const Text("Add a new Car"),
            //       trailing: IconButton(
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => AddVehicle(1)));
            //           },
            //           icon: const Icon(Icons.add)),
            //     ),
            //     ListTile(
            //       leading: const Icon(
            //         Icons.pedal_bike,
            //         size: 40,
            //       ),
            //       title: const Text("Bikes"),
            //       subtitle: const Text("Add a new Bike"),
            //       trailing: IconButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => AddVehicle(0)));
            //         },
            //         icon: const Icon(Icons.add),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ));
  }
}
