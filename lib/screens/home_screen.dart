// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  loadData() async {
    await Provider.of<PuzzlesProvider>(context, listen: false).readMap();
  }

  void initState() {
    // pgns = Provider.of<BoardProvider>(context, listen: false).pgns;
    // levelNumber = Provider.of<BoardProvider>(context, listen: false).levelCount;
    // moveCount = Provider.of<BoardProvider>(context, listen: false).moveCount;
    // solution =
    //     Provider.of<BoardProvider>(context, listen: false).solutions[levelNumber];
    // controller = Provider.of<BoardProvider>(context, listen: false).controller;
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF3dc2bf),=
      // appBar: AppBar(
      //   title: const Text('Chuzzlez'),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/home_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  icon: Icon(Icons.settings),
                  color: Colors.black,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chuzzlez',
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The Chess Puzzlez Game',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 42,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .setOpened();
                      Navigator.pushNamed(context, '/board');
                    },
                    child: Column(children: [
                      Text('Play',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Consumer<UserProvider>(
                          builder: (context, UserProvider user, child) {
                        return Text('Level ${user.getUser.currentLevel + 1}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ));
                      })
                    ]),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.black),
                    ),
                  )
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/puzzlelist');
                    },
                    child: Text('Puzzles List',
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
                      Navigator.pushNamed(context, '/overtheboard');
                    },
                    child: Text('Co-op Match',
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
              )
            ],
          )
        ],
      ),
    );
  }
}
