import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';

class PuzzleScreen extends StatelessWidget {
  int number = PuzzlesProvider().puzzlesCount();
  @override
  Widget build(BuildContext context) {
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
        crossAxisCount: 3,
        crossAxisSpacing: 25.0,
        mainAxisSpacing: 20.0,
        children: [
          for (int i = 1; i <= number; i++)
            Card(
                child: new InkWell(
                    onTap: () {},
                    child: Container(
                        color: Colors.cyanAccent,
                        child: Column(children: [
                          SizedBox(
                            height: 40,
                          ),
                          new Text("Level" + "$i"),
                        ])))),
        ],
      ))

      // ignore: deprecated_member_use
    ]));
  }
}
