import 'package:flutter/material.dart';
import 'package:model/pages/add_vehicle.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var userName = 'Manu Krishna T M';
  var noVehicles = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userName;
      noVehicles;
    });
  }

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
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.person_rounded,
                  size: 80,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '$userName',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Container(
                          child: Text(
                            'Number of Vehicles: $noVehicles',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => ()));
              },
              child: Text('Map'),
            )
          ],
        ),
      ),
    );
  }
}
