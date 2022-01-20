import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _user = Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(children: [
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
            )
          ]),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.teal.shade400, Colors.teal.shade600])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        _user.firstName,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.teal.shade200,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Level",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      _user.currentLevel.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.teal.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Won",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "${_user.completedLevels.length}",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.teal.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Games",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "NA",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.teal.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            // ignore: deprecated_member_use
            // child: RaisedButton(
            //     onPressed: () {},
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(80.0)),
            //     elevation: 0.0,
            //     padding: EdgeInsets.all(0.0),
            //     child: Ink(
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.centerRight,
            //             end: Alignment.centerLeft,
            //             colors: [Colors.teal.shade400, Colors.teal.shade600]),
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //       child: Container(
            //         constraints:
            //             BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            //         alignment: Alignment.center,
            //         child: Text(
            //           "Edit profile",
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 26.0,
            //               fontWeight: FontWeight.w300),
            //         ),
            //       ),
            //     )),
          ),
          SizedBox(
            height: 20.0,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/friends',
                  arguments: {'friends': _user.friends});
            },
            child: Column(children: [
              Text('My Friends',
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
          RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              elevation: 0.0,
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.teal.shade400, Colors.teal.shade600]),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
