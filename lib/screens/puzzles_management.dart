import 'package:chuzzlez/providers/opening_provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

class PuzzleManagementScreen extends StatefulWidget {
  PuzzleManagementScreen({Key? key}) : super(key: key);

  @override
  _PManageState createState() => _PManageState();
}

class _PManageState extends State<PuzzleManagementScreen> {
  late FireStoreServices instance = FireStoreServices();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addpuzzle');
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.black),
            ),
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: instance.getLevels(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text("Level " + (index + 1).toString()),
                        // onLongPress: () {
                        //   // _deleteUser(index);

                        //   setState(() {
                        //     instance.deletePuzzle(
                        //         snapshot.data[index]['levelNumber'].toString());
                        //   });
                        // },
                        onTap: () {
                          Navigator.pushNamed(context, '/puzzle').then((value) {
                            setState(() {});
                          });
                          Provider.of<UserProvider>(context, listen: false)
                              .loadPuzzle(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 24.0,
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            Provider.of<PuzzlesProvider>(context, listen: false)
                                .puzzles
                                .puzzlesList
                                .removeAt(index);
                            instance.deletePuzzle(
                                snapshot.data[index]['levelNumber'].toString());
                          });
                        },
                      )
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
