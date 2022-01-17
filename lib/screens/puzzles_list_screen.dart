// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class PuzzleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int number = Provider.of<PuzzlesProvider>(context, listen: false).getCount;
    var user = Provider.of<UserProvider>(context, listen: false).getUser;
    List<String> completedLevels = user.completedLevels;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 35,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Puzzles List',
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
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/puzzlecreator');
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Colors.black),
                  ),
                )))
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
                      Navigator.pushNamed(context, '/puzzle');
                      Provider.of<UserProvider>(context, listen: false)
                          .loadPuzzle(i);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.5,
                          )),
                          Text("Level " + (i + 1).toString()),
                          Flexible(
                              child: FractionallySizedBox(
                                  // height: 35,
                                  // width: 80,
                                  widthFactor: 1,
                                  heightFactor: 1,
                                  child: completedLevels.contains("$i")
                                      ? Opacity(
                                          opacity: 0.9,
                                          child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.green)))
                                      : Opacity(
                                          opacity: 0.9,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent),
                                          ))))
                        ]))),
        ],
      ))

      // ignore: deprecated_member_use
    ]));
  }
}
