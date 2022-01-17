import 'package:chuzzlez/models/puzzles.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:flutter/cupertino.dart';

class PuzzlesProvider with ChangeNotifier {
  late int levelCount;
  late int length;
  late FireStoreServices instance = FireStoreServices();
  final List<Puzzles> _puzzlesList = [];

  readMap() async {
    var puzzlesMaps = await instance.getAll();
    length = puzzlesMaps.length;
    for (var i = 0; i < length; i++) {
      var puzzlesMap = puzzlesMaps[i];
      if (_puzzlesList.length < length) {
        _puzzlesList.add(Puzzles(
            levelNumber: puzzlesMap['levelNumber'],
            pgn: puzzlesMap['pgn'],
            solution: puzzlesMap['solution']));
      }
    }
    levelCount = _puzzlesList.length;
    // print(_puzzlesList);
    // print(length);
  }

  int get getCount {
    return levelCount;
  }

  Puzzles getPuzzle(int index) {
    return _puzzlesList[index];
  }

  List<Puzzles> get getPuzzles {
    return _puzzlesList;
  }
}
