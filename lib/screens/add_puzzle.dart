import 'package:flutter/material.dart';

// Define a custom Form widget.
class AddPuzzle extends StatefulWidget {
  const AddPuzzle({Key? key}) : super(key: key);

  @override
  MyAddPuzzleState createState() {
    return MyAddPuzzleState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyAddPuzzleState extends State<AddPuzzle> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController stringController = new TextEditingController();
  String? errorMessage;
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
          Text(
            "Add Puzzle",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Futura',
              color: Colors.black,
            ),
          ),
          /*Padding(padding: EdgeInsets.all(8.0)),
          SizedBox(
            width: 20,
            height: 50,
          ),*/
          // Add TextFormFields and ElevatedButton here.
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: "Pgn String",
            ),
          ),
          TextFormField(
            controller: stringController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Solution',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.

                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade900),
              )),
          /* ElevatedButton(
              onPressed: () {
                String a = stringController.text.trim();

                if (a.isEmpty) {
                  //Put some code here for if string a is empty.
                  setState(() {
                    errorMessage = "Your error message";
                  });
                }
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              )),*/
        ],
      ),
    ));
  }
}
