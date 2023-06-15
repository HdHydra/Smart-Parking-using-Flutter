import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:model/model/slot_name_model.dart';
import 'package:model/screens/login_page.dart';
import 'package:model/screens/profile_page.dart';

import '../firebase_options.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _database = FirebaseDatabase.instance.ref();
  // late StreamSubscription _slotNamesStream;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    // _activateListners();
  }

  // void _activateListners() {
  //   _slotNamesStream = _database.child("slotNames/0").onValue.listen((event) {
  //     final data = event.snapshot.value;

  //     updateSlotNames(data);
  //     print(data);
  //   });
  // }

  // void updateSlotNames(data) {
  //   Map<String, int> slotMap = {};
  //   Map<dynamic, dynamic>
  // }

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return const ProfilePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _slotNamesStream.cancel();
    print('deactivated.......................');
    super.deactivate();
  }
}
