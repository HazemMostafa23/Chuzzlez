// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  var currentLevel = 0;

  loadData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await Provider.of<UserProvider>(context, listen: false).readUser();
      setState(() {
        currentLevel = Provider.of<UserProvider>(context, listen: false)
            .getUser
            .currentLevel;
      });
    } catch (e) {
      currentLevel = Provider.of<UserProvider>(context, listen: false)
          .getUser
          .currentLevel;

      print(e);
    }

    await Provider.of<PuzzlesProvider>(context, listen: false).readMap();
  }

  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: Icon(Icons.person),
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
                      Navigator.pushNamed(context, '/puzzle');
                    },
                    child: Column(children: [
                      Text('Play',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Text('Level ${currentLevel + 1}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))
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
                      Navigator.pushNamed(context, '/board',
                          arguments: {'query': 'overtheboard'});
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
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/learning',
                          arguments: {'query': 'concepts'});
                    },
                    child: Text('Learning',
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
            ],
          )
        ],
      ),
    );
  }
}
