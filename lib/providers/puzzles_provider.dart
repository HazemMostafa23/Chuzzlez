import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter/cupertino.dart';

class PuzzlesProvider with ChangeNotifier {
  late var levelCount;
  List<Puzzles> _puzzlesList = [
    Puzzles(),
    Puzzles(
        levelNumber: 2,
        pgn:
            '1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Be7 6. d4 d6 7. O-O Nf6 8. d5 Nb8 9. Nbd2 O-O 10. h3 Nbd7 11. Bd3 a5 12. a4 b6 13. Qe2 Nc5 14. Bc2 Ba6 15. c4 h6 16. Nh2 Nh7 17. f4 exf4 18. Rxf4 Bf6 19. Ra3 Be5 20. Rf1 Ng5 21. Ng4 Qe7 22. Nxe5 Qxe5 23. Qg4 Rae8 24. Re3 Qd4 25. Nf3 Nxf3+ 26. Qxf3 Bxc4 27. Rd1 Qe5 28. Bd2 Qg5',
        solution: '29. Rc3 Be2,30. Qxe2'),
    Puzzles(
        levelNumber: 3,
        pgn:
            '1. d4 d5 2. c4 c6 3. Nf3 Bg4 4. e3 Bxf3 5. Qxf3 Nf6 6. Nd2 e6 7. cxd5 exd5 8. b3 g6 9. Bb2 Bg7 10. Bd3 O-O 11. O-O Nbd7 12. Rac1 Re8 13. Rfe1 Nf8 14. Qg3 Ne4 15. Nxe4 dxe4 16. Bc2 Nd7 17. Qf4 Nf6 18. f3 Nd5 19. Qg3 f5 20. fxe4 fxe4 21. Bb1 Bh6 22. Rc2 Qg5 23. Qxg5 Bxg5 24. Rce2 a5 25. a4 Re6 26. Bc1 Rae8 27. Rf2 Nc3 28. Bc2 b5 29. axb5 cxb5 30. Bd2 Rc8 31. g3 b4 32. h4 Bh6 33. Ra1 Ra8 34. g4 Bf8 35. Rf4 Bd6 36. Rf2 Bg3 37. Rg2 Bxh4 38. Bxc3 bxc3 39. b4 Bd8 40. bxa5 Rxa5',
        solution: '41. Rxa5 Bxa5,42. Bb3')
  ];

  PuzzlesProvider() {
    levelCount = _puzzlesList.length;
  }

  int puzzlesCount() {
    return levelCount;
  }

  Puzzles getPuzzle(int index) {
    return _puzzlesList[index];
  }

  List<Puzzles> get getPuzzles {
    return _puzzlesList;
  }
}
