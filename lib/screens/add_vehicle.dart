import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:model/values/constants.dart';

class AddVehicle extends StatefulWidget {
  final int vehicle;
  const AddVehicle(this.vehicle, {super.key});
  @override
  AddVehicleState createState() => AddVehicleState();
}

class AddVehicleState extends State<AddVehicle> {
  List<String> dropSlotNames = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P'
  ];
  String dropSlotName = "A";
  String dropSlotNumber = "1";
  int dropIndexValue = 0;
  List<String> iconVehicle = [
    'bike',
    'car',
  ];

  final _vehicleName = TextEditingController();
  late String preferedSlot;
  final _vehicleNo = TextEditingController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void addDataToFirestore() {
    final String name = _vehicleName.text;
    final String no = _vehicleNo.text;
    if (name.isNotEmpty && no.isNotEmpty) {
      _db.collection('vehicles').add({
        'type': (widget.vehicle == 0 ? 'bike' : 'car'),
        'uid': FirebaseAuth.instance.currentUser?.uid,
        'name': name,
        'vehicle_no': no,
        'prefered_slot': preferedSlot
      });
      _vehicleName.clear();
      _vehicleNo.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Vehicle'),
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
                  child: Image.asset(
                      'assets/images/${iconVehicle[widget.vehicle]}.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
              child: TextField(
                controller: _vehicleName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vehicle Name',
                    hintText: 'Enter name of your vehicle'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
              child: TextField(
                controller: _vehicleNo,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Vehicle Number',
                    hintText: 'Enter your vehicle number'),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 0),
                child: Row(
                  children: [
                    const Text('Prefered Slot'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: DropdownButton<String>(
                        value: dropSlotName,
                        items: dropSlotNames
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 16),
                              ));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropSlotName = newValue!;
                            dropSlotNumber = '1';
                            dropIndexValue = dropSlotNames.indexOf(newValue);
                          });
                        },
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropSlotNumber,
                      items: List<String>.generate(capacity[dropIndexValue],
                              (i) => (i + 1).toString())
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 16),
                            ));
                      }).toList(),
                      onChanged: (String? newValue2) {
                        setState(() {
                          preferedSlot = '$dropSlotName$newValue2';
                          dropSlotNumber = newValue2!;
                          print(preferedSlot);
                        });
                      },
                    ),
                  ],
                )
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
                    onPressed: () {
                      addDataToFirestore();
                      Navigator.pop(context);
                    },
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
