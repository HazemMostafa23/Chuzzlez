import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    controller.loadPGN(
        '1. d4 Nf6 2. Nf3 e6 3. Bg5 b6 4. Nbd2 Bb7 5. c3 h6 6. Bh4 Be7 7. e3 g5 8. Bg3 Nh5 9. Bd3 Nxg3 10. hxg3 d6 11. a3 Nd7 12. e4 c5 13. dxc5 Nxc5 14. Nb3 Nxd3+ 15. Qxd3 Qc7 16. Nbd4 a6 17. e5 dxe5 18. Nxe6 fxe6 19. Qg6+ Kd7 20. O-O-O+ Kc8');
    return ListView(children: [
      const Center(
          child: Text('Level 4',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ))),
      ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Back',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.black),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Skip',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.black),
            ),
          )
        ],
      ),
      ChessBoard(
        controller: controller,
        boardColor: BoardColor.green,
        boardOrientation: PlayerColor.white,
      )
    ]);
  }
}
