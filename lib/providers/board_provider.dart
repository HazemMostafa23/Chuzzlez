import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import '../models/board.dart';

class BoardProvider with ChangeNotifier {
  ChessBoardController controller = ChessBoardController();

  Board _board = Board();

  Board get getBoard {
    return _board;
  }

  loadPuzzle() {
    controller.loadPGN(
        '1. d4 Nf6 2. Nf3 e6 3. Bg5 b6 4. Nbd2 Bb7 5. c3 h6 6. Bh4 Be7 7. e3 g5 8. Bg3 Nh5 9. Bd3 Nxg3 10. hxg3 d6 11. a3 Nd7 12. e4 c5 13. dxc5 Nxc5 14. Nb3 Nxd3+ 15. Qxd3 Qc7 16. Nbd4 a6 17. e5 dxe5 18. Nxe6 fxe6 19. Qg6+ Kd7 20. O-O-O+ Kc8');
    notifyListeners();
  }
}
