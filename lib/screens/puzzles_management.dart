import 'package:chuzzlez/providers/opening_provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/models/puzzles.dart';

class PuzzleManagementScreen extends StatefulWidget {
  PuzzleManagementScreen({Key? key}) : super(key: key);

  @override
  _PManageState createState() => _PManageState();
}

class _PManageState extends State<PuzzleManagementScreen> {
  late FireStoreServices instance = FireStoreServices();
  Widget build(BuildContext context) {
    // var length =
    //     Provider.of<PuzzlesProvider>(context, listen: false).getPuzzles.length;

    // instance.addPuzzle(length + 1, "hahgahaha", "lolxD");
    // Provider.of<PuzzlesProvider>(context, listen: false)
    //     .puzzles
    //     .puzzlesList
    //     .add(Puzzles(
    //         levelNumber: length + 1, pgn: "hahahaha", solution: "hlolxD"));
    return new Scaffold(
      appBar: new AppBar(),
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
                  return ListTile(
                    title: Text("Level " +
                        snapshot.data[index]['levelNumber'].toString()),
                    onLongPress: () {
                      // _deleteUser(index);

                      setState(() {
                        instance.deletePuzzle(
                            snapshot.data[index]['levelNumber'].toString());
                      });
                    },
                    onTap: () {
                      Navigator.pushNamed(context, '/puzzle').then((value) {
                        setState(() {});
                      });
                      Provider.of<UserProvider>(context, listen: false)
                          .loadPuzzle(index);
                    },
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
