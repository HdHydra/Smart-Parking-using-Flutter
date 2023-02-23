import 'package:flutter/material.dart';

class AddVehicle extends StatefulWidget {
  int vehicle;
  AddVehicle(this.vehicle);
  @override
  AddVehicleState createState() => AddVehicleState();
}

class AddVehicleState extends State<AddVehicle> {
  List<String> iconVehicle = [
    'bike',
    'car',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Vehicle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('assets/images/${iconVehicle[widget.vehicle]}.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vehicle Name',
                    hintText: 'Enter name of your vehicle'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vehicle Number',
                    hintText: 'Enter your vehicle number'),
              ),
            ),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {Navigator.pop(context);},
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
