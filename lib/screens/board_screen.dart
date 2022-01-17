import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/opening_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

class BoardScreen extends StatefulWidget {
  BoardScreen({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<BoardScreen> {
  ChessBoardController controller = ChessBoardController();
  late Map query =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
  late List<String> solution = [];
  bool won = false;
  int moveCount = 0;
  bool isSwitched = false;
  bool undoneMove = false;
  late String sol;
  late PlayerColor color = PlayerColor.white;
  
  void undoMove() {
    if (!controller.getSan().isEmpty) {
      controller.game.undo_move();
      controller.notifyListeners();
      moveCount -= 2;
    }
  }

  void getOpening(String name) {
    solution =
        Provider.of<OpeningProvider>(context, listen: false).getOpening(name);
    print(solution);
  }
  }

  void openingMove() {
    if (moveCount != solution.length) {
      controller.makeMove(
          from: solution[moveCount], to: solution[moveCount + 1]);
      moveCount += 2;
    } else {
      print("Done");
    }
  }

  Widget overTheboard() {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text('Chuzzlez',

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
            Row(
              children: [
                Text(
                  'Toggle AI',
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = !isSwitched;
                    });
                  },
                )
              ],
            ),
          ],
        ),
        ChessBoard(
          controller: controller,
          boardColor: BoardColor.green,
          boardOrientation: color,
          enableUserMoves: !won,
        ),
        OutlinedButton(
          onPressed: () {
            undoMove();
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
      ]),
    );
  }

  Widget openings() {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text(query['name'],
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
          ],
        ),
        ChessBoard(
          controller: controller,
          boardColor: BoardColor.green,
          boardOrientation: color,
          // enableUserMoves: false,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                undoMove();
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
                openingMove();
                print(moveCount);
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.black),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void chooseColor() {
    AlertDialog alert = AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Choose your color',
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
                setState(() {
                  color = PlayerColor.white;
                });
                Navigator.pop(context);
              },
              child: Text(
                'White',
                style: TextStyle(color: Colors.black),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.teal[400]),
              onPressed: () {
                setState(() {
                  color = PlayerColor.black;
                });
                Navigator.pop(context);
              },
              child: Text(
                'Black',
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

  @override
  void initState() {
    super.initState();
    // if (query[query] == 'overtheboard') {
    //   WidgetsBinding.instance!.addPostFrameCallback((_) => chooseColor());
    // }
  }

  @override
  Widget build(BuildContext context) {
    Widget overTheBoard = overTheboard();

    if (query['query'] == "overtheboard") {
      // chooseColor();
      // WidgetsBinding.instance!.addPostFrameCallback((_) => chooseColor());
      return overTheBoard;
    } else if (query['query'] == "opening") {
      Widget opening = openings();
      getOpening(query['name']);
      return opening;
    }
    throw '';
  }
}
