import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chuzzlez/services/fire_store_services.dart';

class FriendsScreen extends StatefulWidget {
  FriendsScreen({Key? key}) : super(key: key);
//
  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<FriendsScreen> {
  late Map query =
      ModalRoute.of(context)?.settings.arguments as Map<String, List>;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 35,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('My Friends',
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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.person_add,
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
        crossAxisCount: 1,
        childAspectRatio: 10 / 4,
        crossAxisSpacing: 0,
        mainAxisSpacing: 1.0,
        children: [
          for (int i = 0; i < query['friends'].length; i++)
            ListView(
              padding: const EdgeInsets.all(0),
              children: <Widget>[
                Container(
                    child: ListTile(
                  title: Text(query['friends'][i]),
                  dense: true,
                  trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Delete"),
                              value: 1,
                            ),
                          ]),
                  tileColor: Colors.blueGrey,
                  onTap: () => print(query['friends'][0]),
                )),
              ],
            )
        ],
      ))
    ]));
  }
}
