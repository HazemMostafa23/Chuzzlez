import 'package:chuzzlez/models/openings.dart';
import 'package:flutter/cupertino.dart';
import 'package:chuzzlez/services/fire_store_services.dart';

class OpeningProvider with ChangeNotifier {
  // final List<Openings> _OpeningsList = [
  //   Openings(
  //       openingName: 'Sicilian Defense', solution: ['e2', 'e4', 'c7', 'c5']),
  //   Openings(openingName: 'French Defense', solution: ['e2', 'e4', 'e7', 'e6']),
  //   Openings(
  //       openingName: 'Spanish Game',
  //       solution: ['e2', 'e7', 'e5', 'g1', 'f3', 'b8', 'c6', 'f', 'b5']),
  //   Openings(
  //       openingName: 'Caro-Kann Defense', solution: ['e2', 'e4', 'c7', 'c6']),
  //   Openings(
  //       openingName: 'Italian Game',
  //       solution: ['e2', 'e4', 'e7', 'e5', 'g1', 'f3', 'b8', 'c6', 'f1', 'c4']),
  //   Openings(
  //       openingName: 'Scandinavian Defense',
  //       solution: ['e2', 'e4', 'd7', 'd5']),
  //   Openings(
  //       openingName: "Alekhine's Defense", solution: ['e2', 'e4', 'g8', 'f6']),
  //   Openings(
  //       openingName: "King's Gambit",
  //       solution: ['e2', 'e4', 'e7', 'e5', 'f2', 'f4']),
  //   Openings(
  //       openingName: 'Scotch Game',
  //       solution: ['e2', 'e4', 'e7', 'e5', 'g1', 'f3', 'b8', 'c6', 'd2', 'd4'])
  // ];
  final List<Openings> _openingsList = [];
  late FireStoreServices instance = FireStoreServices();
  late int levelCount;
  late int length;

  readMap() async {
    var openingsMaps = await instance.getOpenings();
    length = openingsMaps.length;
    for (var i = 0; i < length; i++) {
      var openingsMap = openingsMaps[i];
      if (_openingsList.length < length) {
        _openingsList.add(Openings(
            openingName: openingsMap['openingName'],
            solution: openingsMap['solution']));
      }
    }
    levelCount = _openingsList.length;
  }

  OpeningProvider() {
    levelCount = _openingsList.length;
  }

  int get getCount {
    return levelCount;
  }

  String getOpening(String name) {
    for (int i = 0; i < _openingsList.length; i++) {
      if (_openingsList[i].openingName == name) {
        return _openingsList[i].solution;
      }
    }
    throw '';
  }

  List<Openings> get getOpenings {
    return _openingsList;
  }
}
