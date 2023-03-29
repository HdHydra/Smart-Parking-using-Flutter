import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:model/screens/add_vehicle.dart';
import 'package:model/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var userName;
  var noVehicles = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userName = FirebaseAuth.instance.currentUser?.displayName;
      noVehicles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      drawer: MyDrawer(),
      body: ListView(
        itemExtent: 100.0,
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
          ListTile(
            leading: const Icon(
              Icons.directions_car_sharp,
              size: 40,
            ),
            title: const Text("Cars"),
            subtitle: const Text("Add a new Car"),
            trailing: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddVehicle(1)));
                },
                icon: const Icon(Icons.add)),
          ),
          ListTile(
            leading: const Icon(
              Icons.pedal_bike,
              size: 40,
            ),
            title: const Text("Bikes"),
            subtitle: const Text("Add a new Bike"),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddVehicle(0)));
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
