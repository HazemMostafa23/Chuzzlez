import '../services/fire_store_services.dart';

class Puzzles {
  late int levelNumber;
  late String pgn;
  late String solution;

  Puzzles({this.levelNumber = 1, this.pgn = '', this.solution = ''});
}
