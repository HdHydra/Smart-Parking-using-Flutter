import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Container(
        child: ListView(
          itemExtent: 100.0,
          children: const [
            Center(
              child: Icon(
                Icons.person_rounded,
                size: 80,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.directions_car_sharp,
                size: 40,
              ),
              title: Text("Cars"),
              subtitle: Text("Car of the week"),
              trailing: Icon(
                Icons.add,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.pedal_bike,
                size: 40,
              ),
              title: Text("Bikes"),
              subtitle: Text("Bike of the week"),
              trailing: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
