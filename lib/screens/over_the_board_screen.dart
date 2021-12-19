import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';

class OverTheBoard extends StatefulWidget {
  OverTheBoard({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<OverTheBoard> {
  ChessBoardController controller = ChessBoardController();
  bool won = false;
  bool isSwitched = false;
  late PlayerColor color = PlayerColor.white;

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
    WidgetsBinding.instance!.addPostFrameCallback((_) => chooseColor());
  }

  @override
  Widget build(BuildContext context) {
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
            enableUserMoves: !won)
      ]),
    );
  }
}
