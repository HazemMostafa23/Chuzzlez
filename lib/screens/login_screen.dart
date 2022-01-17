import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import '../models/user.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Column(
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
        SizedBox(
          height: 100,
        ),
        TextField(
          decoration: InputDecoration(
              filled: true, // To set background to light grey
              hintText: "Email",
              border: OutlineInputBorder()),
        ),
        TextField(
          decoration: InputDecoration(
              filled: true, hintText: "Password", border: OutlineInputBorder()),
        ),
        ButtonBar(
          children: [
            TextButton(onPressed: () {}, child: Text("Cancel")),
            ElevatedButton(onPressed: () {}, child: Text("Next"))
          ],
        )
      ],
    ));
  }
}
