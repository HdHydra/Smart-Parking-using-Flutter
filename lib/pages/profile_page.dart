import 'package:flutter/material.dart';
import 'package:model/pages/add_vehicle.dart';

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
          children: [
            Center(
              child: Icon(
                Icons.person_rounded,
                size: 80,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 60.0),
            //   child: Center(
            //     child: SizedBox(
            //       width: 200,
            //       height: 150,
            //       /*decoration: BoxDecoration(
            //             color: Colors.red,
            //             borderRadius: BorderRadius.circular(50.0)),*/
            //       child: Image.asset('assets/images/flutter.png'),
            //     ),
            //   ),
            // ),
            ListTile(
              leading: Icon(
                Icons.directions_car_sharp,
                size: 40,
              ),
              title: Text("Cars"),
              subtitle: Text("Add a new Car"),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddVehicle(1)));
                  },
                  icon: Icon(Icons.add)),
            ),
            ListTile(
              leading: Icon(
                Icons.pedal_bike,
                size: 40,
              ),
              title: Text("Bikes"),
              subtitle: Text("Add a new Bike"),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddVehicle(0)));
                },
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
