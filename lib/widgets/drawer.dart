import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:model/screens/location_page.dart';
import 'package:model/screens/profile_page.dart';

import 'package:easy_geofencing/easy_geofencing.dart';
// import 'package:easy_geofencing/enums/geofence_status.dart';

import '../screens/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _logOut() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: _profile(),
          ),
          ListTile(
            title: const Text('Profile Page'),
            onTap: () {
              // Define what happens when Button 1 is pressed.9
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ProfilePage()));
            },
          ),
          ListTile(
            title: const Text('Find My Location'),
            onTap: () {
              // Define what happens when Button 2 is pressed.
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const LocationPage()));
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Define what happens when Button 3 is pressed.
            },
          ),
          ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                EasyGeofencing.stopGeofenceService();
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) => false);
                //print(
                //    'Successfully logout ${FirebaseAuth.instance.currentUser!.email}');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              })
        ],
      ),
    );
  }
}

Widget _profile() {
  return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.black26,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Main Menu',
          style: TextStyle(fontSize: 25, color: Colors.white),
        )
      ]);
}
