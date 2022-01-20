import 'package:chuzzlez/models/puzzles.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:flutter/cupertino.dart';

class PuzzlesProvider with ChangeNotifier {
  late int levelCount;
  bool read = false;
  late FireStoreServices instance = FireStoreServices();
  Puzzles _puzzles = Puzzles();
  readMap() async {
    var puzzlesMaps = await instance.getLevels();
    _puzzles.length = puzzlesMaps.length;
    for (var i = 0; i < _puzzles.length; i++) {
      var puzzlesMap = puzzlesMaps[i];
      // if (_puzzlesList.length < length) {
      _puzzles.puzzlesList.add(Puzzles(
          levelNumber: puzzlesMap['levelNumber'],
          pgn: puzzlesMap['pgn'],
          solution: puzzlesMap['solution']));
      // }
    }

    levelCount = _puzzles.puzzlesList.length;
    read = true;

    // print(_puzzlesList);
    // print(length);
  }

  int get getCount {
    return levelCount;
  }

  Puzzles getPuzzle(int index) {
    return _puzzles.puzzlesList[index];
  }

  List<Puzzles> get getPuzzles {
    return _puzzles.puzzlesList;
  }
}
