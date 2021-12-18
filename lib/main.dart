import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/board_provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'screens/board_screen.dart';
import 'screens/puzzles_screen.dart';

void main() {
  runApp(MyApp());
}

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
        ),
        ChangeNotifierProvider(
          create: (context) => PuzzlesProvider(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/second': (context) => Board(),
          '/third': (context) => PuzzleScreen()
        },
        title: 'Chuzzlez',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF3dc2bf)),
      ),
    );
  }
}
