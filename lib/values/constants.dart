import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';

final int noSlots = 16;
List capacity = [
  40,
  10,
  10,
  10,
  40,
  20,
  20,
  50,
  40,
  30,
  50,
  30,
  20,
  10,
  40,
  30
];

List<Color> polygonColors = [Colors.green, Colors.red];
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
    LatLng(10.82443901, 76.64201756),
    LatLng(10.82443671, 76.64205975),
    LatLng(10.82428017, 76.64204451),
    LatLng(10.82428247, 76.64199881),
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

void makeList(double a, double b, double c, double d) {
  for (int index = 0; index < noSlots; index++) {
    for (int i = 0; i < capacity[index]; i++) {
      if ((a - b).abs() > (c - d).abs()) {
        double aDash =
            (a > b) ? a : b + (((b - a).abs() / capacity[index]) * i);
        double bDash =
            (a > b) ? a : b + (((b - a).abs() / capacity[index]) * (i + 1));
        double cDash =
            (c > d) ? c : d + (((d - c).abs() / capacity[index]) * i);
        double dDash =
            (c > d) ? c : d + (((d - c).abs() / capacity[index]) * (i + 1));
        print('${aDash} ${bDash} ${cDash} ${dDash}');
      } else {
        double aDash =
            (d > a) ? d : a + (((a - d).abs() / capacity[index]) * i);
        double bDash =
            (d > a) ? d : a + (((a - d).abs() / capacity[index]) * (i + 1));
        double cDash =
            (b > c) ? b : c + (((c - b).abs() / capacity[index]) * i);
        double dDash =
            (b > c) ? b : c + (((c - b).abs() / capacity[index]) * (i + 1));
        print('${aDash} ${bDash} ${cDash} ${dDash}');
      }
      print('${a} ${b} ${c} ${d}');
      
    }
  }
}
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
