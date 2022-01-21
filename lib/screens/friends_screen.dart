import 'package:chuzzlez/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:chuzzlez/models/puzzles.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:provider/provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chuzzlez/services/fire_store_services.dart';

class FriendsScreen extends StatefulWidget {
  FriendsScreen({Key? key}) : super(key: key);
//
  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<FriendsScreen> {
  final _auth = FirebaseAuth.instance;
  late Map query =
      ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

  @override
  void initState() {
    super.initState();
  }

  Widget viewFriends() {
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
                  // Navigator.pop(context);
                  print(query);
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
                    Navigator.pushNamed(context, '/friends',
                        arguments: {'choice': 'addFriends'});
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
          if (query['choice'] != 'addFriends')
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
                                onTap: () => addFriend(query[i]),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text("Delete")
                                  ],
                                ),
                              )
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

  Widget addFriends() {
    Widget customSearchBar = const Text('Add Friends');
    Icon customIcon = Icon(Icons.search);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          title: TextField(
              decoration: InputDecoration(
            hintText: 'Search for friends...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
          )),
        ),
        automaticallyImplyLeading: false,
        actions: [],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }

  Future<void> deleteFriend(String email) async {
    var _user = Provider.of<UserProvider>(context, listen: false).getUser;
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['email'] = email;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    // await firebaseFirestore.collection("users").doc(_user.uid).delete(map['email']);
  }

  Future<void> addFriend(String email) async {
    var _user = Provider.of<UserProvider>(context, listen: false).getUser;
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['email'] = email;

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("users").doc(_user.uid).set(map);
  }

  @override
  Widget build(BuildContext context) {
    Widget view = viewFriends();
    Widget add = addFriends();
    if (query['choice'] == "viewFriends") {
      return view;
    } else if (query['choice'] == "addFriends") {
      return add;
    }
    throw '';
  }
}
