import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ChessBoardController controller = ChessBoardController();
  late Puzzles puzzle;
  late int levelNumber;
  late int moveCount;
  late String solution;
  bool won = false;

  void alertWin() {
    AlertDialog alert = AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('You Won!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ))
        ]),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.teal[400]),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.black),
              ))
        ]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // show the dialog

  void loadPuzzle() {
    levelNumber =
        Provider.of<UserProvider>(context, listen: false).getUser.openedLevel;
    puzzle = Provider.of<PuzzlesProvider>(context, listen: false)
        .getPuzzle(levelNumber);
    controller.loadPGN(puzzle.pgn);
    // controller.clearBoard();
    moveCount = 0;
    solution = puzzle.solution;
  }

  @override
  void initState() {
    // pgns = Provider.of<BoardProvider>(context, listen: false).pgns;
    // levelNumber = Provider.of<BoardProvider>(context, listen: false).levelCount;
    // moveCount = Provider.of<BoardProvider>(context, listen: false).moveCount;
    // solution =
    //     Provider.of<BoardProvider>(context, listen: false).solutions[levelNumber];
    // controller = Provider.of<BoardProvider>(context, listen: false).controller;
    loadPuzzle();
    super.initState();
  }

  // var pgns = Provider.of<BoardProvider>(context, listen: false).pgns;
  void checkMove(String solution, int levelNumber, int movecount) {
    // print('function');
    List<String> solSplit = solution.split(',');
    List<String> solFinal = solSplit[movecount].split(' ');
    String lastMove = controller.getSan().last!.split(' ')[1];

    // checks if last move was made by player or system
    if (controller.getSan().last!.split(' ').length == 2) {
      // print('if 1');
      // print(levelNumber);
      // checks if last move is same as solution move
      if (lastMove == solFinal[1] || controller.isCheckMate()) {
        // print('if 2');
        // print('solution ' + solFinal[1]);
        // print('last move ' + lastMove);
        // print('sol length ' + solFinal.length.toString());
        // checks if system has a move after player
        if (solFinal.length == 3) {
          // print('if 3');
          // print(solFinal[2]);
          controller.makeMoveWithNormalNotation(solFinal[2]);
          moveCount++;
        } else {
          // print('you won');
          setState(() {
            this.won = true;
            alertWin();
          });
        }
      } else {
        controller.game.undo_move();
        controller.notifyListeners();
      }
    } else {
      // print('else');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text('level ${levelNumber + 1}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ))),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                moveCount = 0;
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
            ),
            OutlinedButton(
              onPressed: () {
                var count = Provider.of<PuzzlesProvider>(context, listen: false)
                    .getPuzzles
                    .length;
                Provider.of<UserProvider>(context, listen: false)
                    .getUser
                    .openedLevel += 1;
                if (levelNumber != count - 1) {
                  setState(() {
                    won = false;
                  });
                  loadPuzzle();
                }
              },
              child: const Text('Next',
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
          enableUserMoves: !won,
          onMove: () {
            checkMove(solution, levelNumber, moveCount);
          },
        )
      ]),
    );
  }
}
