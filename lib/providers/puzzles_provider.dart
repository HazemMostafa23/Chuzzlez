import 'package:flutter/cupertino.dart';

class PuzzlesProvider with ChangeNotifier {
  List<String> puzzlesList = ["1", "2", "3", "4"];
  List<bool> puzzlesDone = [];
  late var levelCount;
  var moveCount = 0;

  PuzzlesProvider() {
    levelCount = puzzlesList.length;
  }
  int puzzlesCount() {
    return levelCount;
  }
}
