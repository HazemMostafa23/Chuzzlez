import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

class LearningScreen extends StatefulWidget {
  LearningScreen({Key? key}) : super(key: key);

  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<LearningScreen> {
  ChessBoardController controller = ChessBoardController();
  late Map query =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;

  @override
  void initState() {
    // if (query == "concepts") {
    //   return concepts();
    // } else if (query == "openings") {
    //   return openings();
    // }
    super.initState();
  }

  Widget openings() {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text('Openings',
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
        SizedBox(
          height: 20,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('Opening 1',
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
              child: Text('Opening 2',
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
              child: Text('Opening 3',
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
          ],
        )
      ]),
    );
  }

  Widget concepts() {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text('widget 1',
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
        SizedBox(
          height: 20,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/learning',
                    arguments: {'query': 'openings'});
              },
              child: Text('Openings',
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
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (query == "concepts") {
    //   return concepts();
    // } else if (query == "openings") {
    //   return openings();
    // }
    Widget concept = concepts();
    Widget opening = openings();
    if (query['query'] == "concepts") {
      return concept;
    } else if (query['query'] == "openings") {
      return opening;
    }
    throw '';
  }
}
