import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PuzzleCreator extends StatefulWidget {
  PuzzleCreator({Key? key}) : super(key: key);

  @override
  _PuzzleCreator createState() => _PuzzleCreator();
}

class _PuzzleCreator extends State<PuzzleCreator> {
  ChessBoardController controller = ChessBoardController();
  String? selectedPiece;
  @override
  void initState() {
    controller.clearBoard();
    super.initState();
  }

  Widget pieceButton(String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPiece = name;
        });
      },
      child: Container(
        child: Image.asset('images/pieces/$name.png'),
        color: selectedPiece == name ? Colors.white : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
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
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          pieceButton('w'),
          pieceButton('wB'),
          pieceButton('wN'),
          pieceButton('wR'),
          pieceButton('wK'),
          pieceButton('wQ'),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          pieceButton('b'),
          pieceButton('bB'),
          pieceButton('bN'),
          pieceButton('bR'),
          pieceButton('bK'),
          pieceButton('bQ'),
        ]),
      ]),
    );
  }
}
