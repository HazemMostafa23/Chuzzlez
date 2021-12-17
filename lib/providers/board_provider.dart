import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import '../models/board.dart';

class BoardProvider with ChangeNotifier {
  ChessBoardController controller = ChessBoardController();
  var pgns = <String>[
    '1. d4 Nf6 2. Bf4 e6 3. Nf3 Be7 4. e3 O-O 5. Bd3 d5 6. O-O c5 7. c4 Nc6 8. cxd5 Nxd5 9. Bg3 Qb6 10. b3 cxd4 11. exd4 Bd7 12. Bc2 a5 13. Qd3 Nf6 14. Nbd2 Nb4 15. Nc4 Qa6 16. Qe2 Nxc2 17. Qxc2 Rfc8 18. Rac1 b5 19. Nfd2 bxc4 20. bxc4 Bd6 21. Qd3 Bxg3 22. Qxg3 Rab8 23. Nb3 a4 24. Nc5 Qa7 25. Rfd1 Bc6 26. f3 Rb2 27. Qd6 Nd7 28. Nxd7 Bxd7 29. c5 Bc6 30. Re1 Qa5 31. Red1 a3 32. Ra1 Qc3 33. Qf4 Bd5 34. Rac1 Rc2 35. Rxc2 Qxc2 36. Rd2 Qb1+ 37. Kf2 Bxa2 38. Qd6 Bd5 39. Qd7 Ra8 40. c6 a2 41. c7 Qb7'
  ];
  var solutions = <String>['42. Qd8+ Rxd8,43. cxd8=Q#'];
  var levelCount = 0;
  var moveCount = 0;

  Board _board = Board();

  Board get getBoard {
    return _board;
  }

  loadPuzzle(
      {String puzzlePgn =
          '1. d4 Nf6 2. Bf4 e6 3. Nf3 Be7 4. e3 O-O 5. Bd3 d5 6. O-O c5 7. c4 Nc6 8. cxd5 Nxd5 9. Bg3 Qb6 10. b3 cxd4 11. exd4 Bd7 12. Bc2 a5 13. Qd3 Nf6 14. Nbd2 Nb4 15. Nc4 Qa6 16. Qe2 Nxc2 17. Qxc2 Rfc8 18. Rac1 b5 19. Nfd2 bxc4 20. bxc4 Bd6 21. Qd3 Bxg3 22. Qxg3 Rab8 23. Nb3 a4 24. Nc5 Qa7 25. Rfd1 Bc6 26. f3 Rb2 27. Qd6 Nd7 28. Nxd7 Bxd7 29. c5 Bc6 30. Re1 Qa5 31. Red1 a3 32. Ra1 Qc3 33. Qf4 Bd5 34. Rac1 Rc2 35. Rxc2 Qxc2 36. Rd2 Qb1+ 37. Kf2 Bxa2 38. Qd6 Bd5 39. Qd7 Ra8 40. c6 a2 41. c7 Qb7'}) {
    controller.loadPGN(puzzlePgn);
    notifyListeners();
  }
}
