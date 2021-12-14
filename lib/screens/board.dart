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
    return ChessBoard(
      controller: controller,
      boardColor: BoardColor.green,
      boardOrientation: PlayerColor.white,
    );
  }
}
