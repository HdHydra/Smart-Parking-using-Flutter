// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'dart:math';

Map<String, int> slotNames = {
  'A1': 0,
  'A2': 1,
  'A3': 0,
  'A4': 0,
  'A5': 0,
  'A6': 0,
  'A7': 0,
  'A8': 1,
  'A9': 0,
  'A10': 0,
  'A11': 0,
  'A12': 0,
  'A13': 0,
  'A14': 0,
  'A15': 0,
  'A16': 0,
  'A17': 0,
  'A18': 0,
  'A19': 0,
  'A20': 0,
  'A21': 0,
  'A22': 0,
  'A23': 0,
  'A24': 0,
  'A25': 0,
  'A26': 0,
  'A27': 0,
  'A28': 0,
  'A29': 0,
  'A30': 0,
  'A31': 0,
  'A32': 0,
  'A33': 0,
  'A34': 0,
  'A35': 0,
  'A36': 0,
  'A37': 0,
  'A38': 0,
  'A39': 0,
  'A40': 0,
  'A41': 0,
  'A42': 0,
  'A43': 0,
  'A44': 0,
  'A45': 0,
  'A46': 0,
  'A47': 0,
  'A48': 0,
  'B1': 0,
  'B2': 0,
  'B3': 0,
  'B4': 0,
  'B5': 0,
  'B6': 0,
  'B7': 0,
  'B8': 0,
  'B9': 0,
  'B10': 0,
  'B11': 0,
  'B12': 0,
  'B13': 0,
  'B14': 0,
  'B15': 0,
  'B16': 0,
  'B17': 0,
  'B18': 0,
  'B19': 0,
  'B20': 0,
  'B21': 0,
  'B22': 0,
  'B23': 0,
  'B24': 0,
  'B25': 0,
  'B26': 0,
  'B27': 0,
  'B28': 0,
  'B29': 0,
  'B30': 0,
  'B31': 0,
  'B32': 0,
  'B33': 0,
  'B34': 0,
  'B35': 0,
  'B36': 0,
  'B37': 0,
  'B38': 0,
  'B39': 0,
  'B40': 0,
  'B41': 0,
  'B42': 0,
  'B43': 0,
  'B44': 0,
  'B45': 0,
  'B46': 0,
  'B47': 0,
  'B48': 0,
  'B49': 0,
  'B50': 0,
  'B51': 0,
  'B52': 0,
  'B53': 0,
  'B54': 0,
  'B55': 0,
  'B56': 0,
  'B57': 0,
  'B58': 0,
  'B59': 0,
  'B60': 0,
  'B61': 0,
  'B62': 0,
  'B63': 0,
  'B64': 0,
  'B65': 0,
  'B66': 0,
  'B67': 0,
  'B68': 0,
  'B69': 0,
  'B70': 0,
  'C1': 0,
  'C2': 0,
  'C3': 0,
  'C4': 0,
  'C5': 0,
  'C6': 0,
  'C7': 0,
  'C8': 0,
  'C9': 0,
  'C10': 0,
  'C11': 0,
  'C12': 0,
  'C13': 0,
  'C14': 0,
  'C15': 0,
  'C16': 0,
  'C17': 0,
  'C18': 0,
  'C19': 0,
  'C20': 0,
  'C21': 0,
  'C22': 0,
  'C23': 0,
  'C24': 0,
  'C25': 0,
  'C26': 0,
  'C27': 0,
  'C28': 0,
  'C29': 0,
  'C30': 0,
  'C31': 0,
  'C32': 0,
  'C33': 0,
  'C34': 0,
  'C35': 0,
  'C36': 0,
  'C37': 0,
  'C38': 0,
  'C39': 0,
  'C40': 0,
  'D1': 0,
  'D2': 0,
  'D3': 0,
  'D4': 0,
  'D5': 0,
  'D6': 0,
  'D7': 0,
  'D8': 0,
  'D9': 0,
  'D10': 0,
  'D11': 0,
  'E1': 0,
  'E2': 0,
  'E3': 0,
  'F1': 0,
  'F2': 0,
  'F3': 0,
  'F4': 0,
  'F5': 0,
  'F6': 0,
  'G1': 0,
  'G2': 0,
  'G3': 0,
  'G4': 0,
  'G5': 0,
  'G6': 0,
  'G7': 0,
  'G8': 0,
  'H1': 0,
  'H2': 0,
  'H3': 0,
  'H4': 0,
  'H5': 0,
  'H6': 0,
  'H7': 0,
  'H8': 0,
  'H9': 0,
  'H10': 0,
  'H11': 0,
  'H12': 0,
  'I1': 0,
  'I2': 0,
  'I3': 0,
  'I4': 0,
  'I5': 0,
  'I6': 0,
  'J1': 0,
  'J2': 0,
  'K1': 0,
  'K2': 0,
  'K3': 0,
  'K4': 0,
  'K5': 0,
  'K6': 0,
  'K7': 0,
  'K8': 0,
  'K9': 0,
  'K10': 0,
  'K11': 0,
  'K12': 0,
  'K13': 0,
  'K14': 0,
  'L1': 0,
  'L2': 0,
  'L3': 0,
  'L4': 0,
  'M1': 0,
  'M2': 0,
  'M3': 0,
  'M4': 0,
  'N1': 0,
  'N2': 0,
  'N3': 0,
  'N4': 0,
  'O1': 0,
  'O2': 0,
  'O3': 0,
  'O4': 0,
  'P1': 0,
  'P2': 0,
  'P3': 1,
  'P4': 0,
  'P5': 0,
  'P6': 1,
  'P7': 0,
  'P8': 0,
};
final int noSlots = 16;
List<int> capacity = [48, 70, 40, 11, 3, 6, 8, 12, 6, 2, 14, 4, 4, 4, 4, 8];

String geoStatus = "";
String pslot = "";
int toastRes = 2;

List<Color> polygonColors = [Colors.green, Colors.red, Colors.yellow];
List<List<LatLng>> polygonSlotsCoordinates = [];
List<List<LatLng>> polygonCoordinates = [
  [
    LatLng(10.82343014, 76.64234197),
    LatLng(10.82336177, 76.64234280),
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
    LatLng(10.82428247, 76.64199881),
    LatLng(10.82443901, 76.64201756),
    LatLng(10.82443671, 76.64205975),
    LatLng(10.82428017, 76.64204451),
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
// getPreferedSlots() async {
//   QuerySnapshot<Map<String, dynamic>> snapshot =
//       await FirebaseFirestore.instance.collection('vehicles').get();
//   try {
//     return snapshot.docs[]['prefered_slot'];
//   } finally {}
// }

void makeSlots() {
  makeList(10.82346691, 76.64191132, 10.82343014, 76.64234197, 10.82336177,
      76.64234280, 10.82339871, 76.64190508, 0);
  makeList(10.82338039, 76.64265540, 10.82332156, 76.64334505, 10.82326191,
      76.64333840, 10.82331911, 76.64265540, 1);
  makeList(10.82351072, 76.64233631, 10.82355446, 76.64169178, 10.82361117,
      76.64169609, 10.82356712, 76.64233982, 2);
  makeList(10.82406636, 76.64168289, 10.82398465, 76.64201898, 10.82394543,
      76.64200900, 10.82402387, 76.64166958, 3);
  makeList(10.82393235, 76.64237837, 10.82385391, 76.64247154, 10.82382123,
      76.64243827, 10.82389313, 76.64235175, 4);
  makeList(10.82412846, 76.64203229, 10.82399772, 76.64222530, 10.82397158,
      76.64218537, 10.82408270, 76.64199236, 5);
  makeList( 10.82443671, 76.64205975, 10.82428017,
      76.64204451, 10.82428247, 76.64199881, 10.82443901, 76.64201756, 6);
  makeList(10.82409864, 76.64137955, 10.82406432, 76.64161540, 10.82402755,
      76.64161665, 10.82406187, 76.64137955, 7);
  makeList(10.82415149, 76.64185199, 10.82412107, 76.64191394, 10.82407924,
      76.64190232, 10.82410206, 76.64185199, 8);
  makeList(10.82420473, 76.64120154, 10.82423515, 76.64120929, 10.82421614,
      76.64124026, 10.82420093, 76.64124413, 9);
  makeList(10.82408760, 76.64118239, 10.82414521, 76.64118364, 10.82414031,
      76.64122482, 10.82408148, 76.64121484, 10);
  makeList(10.82418192, 76.64160033, 10.82415530, 76.64174358, 10.82411727,
      76.64174745, 10.82415149, 76.64160033, 11);
  makeList(10.82493440, 76.64368379, 10.82500713, 76.64368814, 10.82500142,
      76.64374186, 10.82492869, 76.64373606, 12);
  makeList(10.82467200, 76.64367798, 10.82476327, 76.64368379, 10.82475614,
      76.64374186, 10.82466915, 76.64374332, 13);
  makeList(10.82497575, 76.64332662, 10.82502852, 76.64333243, 10.82502424,
      76.64339196, 10.82496720, 76.64339051, 14);
  makeList(10.82382065, 76.64332662, 10.82400461, 76.64334550, 10.82400033,
      76.64339631, 10.82381637, 76.64337744, 15);
}

void makeList(double x1, double y1, double x2, double y2, double x3, double y3,
    double x4, double y4, int slotno) {
  double divx1, divx2, divy1, divy2;
  List<LatLng> temp;
  divx1 = (x2 - x1) / capacity[slotno];
  divy1 = (y2 - y1) / capacity[slotno];
  divx2 = (x3 - x4) / capacity[slotno];
  divy2 = (y3 - y4) / capacity[slotno];
  for (int i = 0; i < capacity[slotno]; i++) {
    temp = [
      LatLng(x1 + divx1 * i, y1 + divy1 * i),
      LatLng(x1 + divx1 * (i + 1), y1 + divy1 * (i + 1)),
      LatLng(x4 + divx2 * (i + 1), y4 + divy2 * (i + 1)),
      LatLng(x4 + divx2 * i, y4 + divy2 * i),
    ];
    polygonSlotsCoordinates.add(temp);
  }
}

// void nameGenerate() {
//   polygonSlotsCoordinates.asMap().entries.map((entry) {
//     int index = entry.key;
//     String slotName = "";
//     int slotsNo = 0;
//     int slotCount = 0;
//     int sum = 0;

//     if (slotsNo > capacity[slotCount]) {
//       sum = sum + capacity[slotCount];
//       slotsNo = index - sum;
//       slotCount++;
//     }

//     slotNames[index] = "${slotCount + 1}-${slotsNo + 1}";
//     print(slotNames);

//     slotsNo++;
//   });
// }

// void makeList(double a, double b, double c, double d) {
//   for (int index = 0; index < noSlots; index++) {
//     for (int i = 0; i < capacity[index]; i++) {
//       if ((a - b).abs() > (c - d).abs()) {
//         double aDash =
//             (a > b) ? a : b + (((b - a).abs() / capacity[index]) * i);
//         double bDash =
//             (a > b) ? a : b + (((b - a).abs() / capacity[index]) * (i + 1));
//         double cDash =
//             (c > d) ? c : d + (((d - c).abs() / capacity[index]) * i);
//         double dDash =
//             (c > d) ? c : d + (((d - c).abs() / capacity[index]) * (i + 1));
//         print('${aDash} ${bDash} ${cDash} ${dDash}');
//       } else {
//         double aDash =
//             (d > a) ? d : a + (((a - d).abs() / capacity[index]) * i);
//         double bDash =
//             (d > a) ? d : a + (((a - d).abs() / capacity[index]) * (i + 1));
//         double cDash =
//             (b > c) ? b : c + (((c - b).abs() / capacity[index]) * i);
//         double dDash =
//             (b > c) ? b : c + (((c - b).abs() / capacity[index]) * (i + 1));
//         print('${aDash} ${bDash} ${cDash} ${dDash}');
//       }
//       print('${a} ${b} ${c} ${d}');
//     }
//   }
// }
// void makeList(double a, double b, double c, double d) {
//   for (int index = 0; index < noSlots; index++) {
//     for (int i = 0; i < capacity[index]; i++) {
//       if ((a - b).abs() > (c - d).abs()) {
//         double aDash = (a>b)?a:b + (((b - a).abs() / capacity[index]) * i);
//         double cDash = (c>d)?c:d + (((d - c).abs() / capacity[index]) * i);
//       } else {
//         double bc = (b>c)?b:c + (((c - b).abs() / capacity[index]) * i);
//         double da = (d>a)?d:a + (((a - d).abs() / capacity[index]) * i);
//       }
//     }
//   }
// }
