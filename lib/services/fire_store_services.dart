import 'package:chuzzlez/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

import 'package:chuzzlez/screens/settings_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreServices {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Levels');

  Future<Map> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    var x = allData[0] as Map;
    return x;
  }

  Future<List> getAll() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}
