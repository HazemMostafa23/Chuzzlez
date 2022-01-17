import 'package:chuzzlez/models/openings.dart';
import 'package:flutter/cupertino.dart';

class OpeningProvider with ChangeNotifier {
  late int levelCount;
  final List<Openings> _OpeningsList = [
    Openings(openingName: 'Sicilean Defense', solution: '1. e4 c5'),
    Openings(openingName: 'French Defense', solution: '1. e4 e6'),
    Openings(
        openingName: 'Spanish Game', solution: '1. e4 e5 2. Nf3 Nc6 3. Bb5'),
    Openings(openingName: 'Caro-Kann Defense', solution: '1. e4 c6'),
    Openings(
        openingName: 'Italian Game', solution: '1. e4 e5 2. Nf3 Nc6 3. Bc4'),
    Openings(openingName: 'Scandinavian Defense', solution: '1. e4 d5'),
    Openings(openingName: "Alekhine's Defense", solution: '1. e4 Nf6'),
    Openings(openingName: "King's Gambit", solution: '1. e4 e5 2. f4'),
    Openings(openingName: 'Scotch Game', solution: '1. e4 e5 2. Nf3 Nc6 3. d4')
  ];

  OpeningsProvider() {
    levelCount = _OpeningsList.length;
  }

  int get getCount {
    return levelCount;
  }

  Openings getOpening(int index) {
    return _OpeningsList[index];
  }

  List<Openings> get getOpenings {
    return _OpeningsList;
  }
}
