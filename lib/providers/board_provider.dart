import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import '../models/board.dart';

class BoardProvider with ChangeNotifier {
  ChessBoardController controller = ChessBoardController();
  var pgns = <String>[
    '1. d4 Nf6 2. Bf4 e6 3. Nf3 Be7 4. e3 O-O 5. Bd3 d5 6. O-O c5 7. c4 Nc6 8. cxd5 Nxd5 9. Bg3 Qb6 10. b3 cxd4 11. exd4 Bd7 12. Bc2 a5 13. Qd3 Nf6 14. Nbd2 Nb4 15. Nc4 Qa6 16. Qe2 Nxc2 17. Qxc2 Rfc8 18. Rac1 b5 19. Nfd2 bxc4 20. bxc4 Bd6 21. Qd3 Bxg3 22. Qxg3 Rab8 23. Nb3 a4 24. Nc5 Qa7 25. Rfd1 Bc6 26. f3 Rb2 27. Qd6 Nd7 28. Nxd7 Bxd7 29. c5 Bc6 30. Re1 Qa5 31. Red1 a3 32. Ra1 Qc3 33. Qf4 Bd5 34. Rac1 Rc2 35. Rxc2 Qxc2 36. Rd2 Qb1+ 37. Kf2 Bxa2 38. Qd6 Bd5 39. Qd7 Ra8 40. c6 a2 41. c7 Qb7',
    '1. e4 e5 2. Nf3 Nc6 3. Bc4 Bc5 4. b4 Bxb4 5. c3 Be7 6. d4 d6 7. O-O Nf6 8. d5 Nb8 9. Nbd2 O-O 10. h3 Nbd7 11. Bd3 a5 12. a4 b6 13. Qe2 Nc5 14. Bc2 Ba6 15. c4 h6 16. Nh2 Nh7 17. f4 exf4 18. Rxf4 Bf6 19. Ra3 Be5 20. Rf1 Ng5 21. Ng4 Qe7 22. Nxe5 Qxe5 23. Qg4 Rae8 24. Re3 Qd4 25. Nf3 Nxf3+ 26. Qxf3 Bxc4 27. Rd1 Qe5 28. Bd2 Qg5',
    '1. d4 d5 2. c4 c6 3. Nf3 Bg4 4. e3 Bxf3 5. Qxf3 Nf6 6. Nd2 e6 7. cxd5 exd5 8. b3 g6 9. Bb2 Bg7 10. Bd3 O-O 11. O-O Nbd7 12. Rac1 Re8 13. Rfe1 Nf8 14. Qg3 Ne4 15. Nxe4 dxe4 16. Bc2 Nd7 17. Qf4 Nf6 18. f3 Nd5 19. Qg3 f5 20. fxe4 fxe4 21. Bb1 Bh6 22. Rc2 Qg5 23. Qxg5 Bxg5 24. Rce2 a5 25. a4 Re6 26. Bc1 Rae8 27. Rf2 Nc3 28. Bc2 b5 29. axb5 cxb5 30. Bd2 Rc8 31. g3 b4 32. h4 Bh6 33. Ra1 Ra8 34. g4 Bf8 35. Rf4 Bd6 36. Rf2 Bg3 37. Rg2 Bxh4 38. Bxc3 bxc3 39. b4 Bd8 40. bxa5 Rxa5'
  ];
  var solutions = <String>[
    '42. Qd8+ Rxd8,43. cxd8=Q#',
    '29. Rc3 Be2,30. Qxe2',
    '41. Rxa5 Bxa5,42. Bb3'
  ];
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
