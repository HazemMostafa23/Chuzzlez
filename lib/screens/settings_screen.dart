import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import '../models/user.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      OutlinedButton(
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
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          new Container(
            decoration: BoxDecoration(color: Colors.teal.shade400),
            width: 360,
            child: Text('Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 120),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('Theme',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        SizedBox(width: 170),
        SizedBox(
          width: 20,
          height: 20,
          child:
              const DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 20,
          height: 20,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black, width: 3))),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 20,
          height: 20,
          child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.yellow)),
        )
        // Text('Default',
        //     style: TextStyle(
        //       fontSize: 24,
        //     )),
      ]),
      SizedBox(height: 50),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('Auto-load Puzzlez',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        SizedBox(width: 90),
        Switch(
          onChanged: null,
          value: false,
          activeColor: Colors.blue,
          activeTrackColor: Colors.yellow,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey,
        ),
      ]),
      SizedBox(height: 50),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('Volume',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        SizedBox(width: 200),
        IconButton(
            onPressed: null,
            icon: Icon(
              Icons.volume_up,
              size: 40,
            ))
      ]),
      SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text('Log Out',
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
    ]));
  }
}
