// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:chuzzlez/providers/leaderboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/opening_provider.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  var currentLevel = 0;

  loadData() async {
    try {
      print(
          Provider.of<UserProvider>(context, listen: false).getUser.toString());
      print("AUTH" + FirebaseAuth.instance.currentUser.toString());
      String? uid = FirebaseAuth.instance.currentUser!.uid;
      await Provider.of<UserProvider>(context, listen: false).readUser();
      print(
          Provider.of<UserProvider>(context, listen: false).getUser.toString());
      print("AUTH1" + FirebaseAuth.instance.currentUser.toString());
    } catch (e) {
      setState(() {
        currentLevel = Provider.of<UserProvider>(context, listen: false)
            .getUser
            .currentLevel;
      });
    } finally {
      setState(() {
        currentLevel = Provider.of<UserProvider>(context, listen: false)
            .getUser
            .currentLevel;
      });
      if (Provider.of<PuzzlesProvider>(context, listen: false).read == false) {
        await Provider.of<PuzzlesProvider>(context, listen: false).readMap();
      }
      if (Provider.of<OpeningProvider>(context, listen: false).read == false) {
        await Provider.of<OpeningProvider>(context, listen: false).readMap();
      }
      Provider.of<LeaderboardProvider>(context, listen: false).readScoreBoard();
    }
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
              if (_selectedIndex == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Provider.of<UserProvider>(context, listen: false)
                            .setOpened();
                        Navigator.pushNamed(context, '/puzzle').then((value) {
                          setState(() {
                            currentLevel = Provider.of<UserProvider>(context,
                                    listen: false)
                                .getUser
                                .currentLevel;
                          });
                        });
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
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/puzzlelist')
                            .then((value) {
                          setState(() {
                            currentLevel = Provider.of<UserProvider>(context,
                                    listen: false)
                                .getUser
                                .currentLevel;
                          });
                        });
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
                  ],
                ),
              if (_selectedIndex == 1)
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  // alignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    )
                  ],
                ),
              if (_selectedIndex == 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/learning',
                            arguments: {'query': 'openings'});
                      },
                      child: Column(children: [
                        Text('Openings',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ]),
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.teal,
        iconSize: 40,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 40),
        selectedItemColor: Colors.amberAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Puzzles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_sharp),
            label: 'Learning',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.people),
          //   label: 'Friends',
          // ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
