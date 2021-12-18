// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int number =
        Provider.of<PuzzlesProvider>(context, listen: false).puzzlesCount();
    var user = Provider.of<UserProvider>(context, listen: false).getUser;
    List<String> completedLevels = user.completedLevels;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 15,
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
      OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
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
      SizedBox(
        height: 30,
      ),

      Flexible(
          child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: [
          for (int i = 1; i <= number; i++)
            Card(
                clipBehavior: Clip.hardEdge,
                color: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {},
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: FractionallySizedBox(
                            heightFactor: 0.5,
                          )),
                          Text("Level " "$i"),
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
                                                  color: Colors.red)))
                                      : Opacity(
                                          opacity: 0.9,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Colors.green),
                                          ))))
                        ]))),
        ],
      ))

      // ignore: deprecated_member_use
    ]));
  }
}
