import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/board_provider.dart';

class Board extends StatefulWidget {
  Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  ChessBoardController controller = ChessBoardController();
  var pgns = BoardProvider().pgns;
  var lvlCount = BoardProvider().levelCount;
  var solution = BoardProvider().solutions[BoardProvider().levelCount];
  var moveCount = BoardProvider().moveCount;
  // var pgns = Provider.of<BoardProvider>(context, listen: false).pgns;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print('test');
      var sol = solution.split(',');
      sol = sol[moveCount].split(' ');
      var lastMove = controller.getSan().last;
      var lastMoveSplit = lastMove!.split(' ');
      if (lastMoveSplit.length == 2) {
        moveCount++;
        print(sol[1]);
        print(lastMoveSplit[1]);
        if (lastMoveSplit[1] == sol[1]) {
          if (sol.length == 3) {
            controller.makeMoveWithNormalNotation(sol[2]);
          } else {
            print('you won!');
          }
        } else {
          controller.undoMove();
        }
      }
      // if () {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Chuzzlez'),
      // ),
      body: ListView(children: [
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
              onPressed: () {
                // Navigator.pop(context);
                print(controller.getSan().last);
              },
              child: const Text('Home',
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
              onPressed: () {
                controller.loadPGN(pgns[lvlCount]);
                lvlCount += 1;
                // Provider.of<BoardProvider>(context, listen: false).loadPuzzle();
              },
              child: const Text('Next Puzzle',
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
      ]),
    );
  }
}
