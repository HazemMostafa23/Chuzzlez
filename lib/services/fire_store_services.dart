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
  CollectionReference levelsCollection =
      FirebaseFirestore.instance.collection('Levels');
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  CollectionReference openingsCollection =
      FirebaseFirestore.instance.collection('openings');

  String uid = FirebaseAuth.instance.currentUser!.uid;
  Future<List> getLevels() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await levelsCollection.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  Future<List> getUsers() async {
    QuerySnapshot querySnapshot = await usersCollection.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }


  Future<DocumentSnapshot> readUser() async {
    DocumentSnapshot documentSnapshot = await usersCollection.doc(uid).get();
    return documentSnapshot;
}
  Future<List> getOpenings() async {
    QuerySnapshot querySnapshot = await openingsCollection.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;

  }
}
