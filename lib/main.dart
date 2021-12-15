import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/board_provider.dart';
import 'screens/board.dart';

void main() {
  runApp(MyApp());
}

// Color 0x003dc2bf
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoardProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Chuzzlez',
        home: Scaffold(
          backgroundColor: const Color(0xFF3dc2bf),
          // appBar: AppBar(
          //   title: const Text('Chuzzlez'),
          // ),
          body: Board(),
        ),
      ),
    );
  }
}
