import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/opening_provider.dart';
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
    int number = Provider.of<OpeningProvider>(context, listen: false).getCount;
    var list = Provider.of<OpeningProvider>(context, listen: false).getOpenings;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 35,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Openings',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: OutlinedButton(
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
              )),
        ),
      ]),
      Flexible(
          child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: [
          for (int i = 0; i < number; i++)
            Card(
                clipBehavior: Clip.hardEdge,
                color: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, '/board', arguments: {
                        'query': 'opening',
                        'name': list[i].openingName
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.5,
                          )),
                          Text(list[i].openingName),
                          Flexible(
                              child: FractionallySizedBox(
                                  widthFactor: 1,
                                  heightFactor: 1,
                                  child: Opacity(
                                      opacity: 0.9,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.green)))))
                        ]))),
        ],
      ))

      // ignore: deprecated_member_use
    ]));
  }

  Widget concepts() {
    return Scaffold(
      body: ListView(children: [
        SizedBox(height: 7),
        Center(
            child: Text('Learning',
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
