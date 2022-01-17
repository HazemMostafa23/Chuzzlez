import 'package:chuzzlez/screens/login_screen.dart';
import 'package:chuzzlez/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import 'package:chuzzlez/providers/puzzles_provider.dart';
import 'screens/board_screen.dart';
import 'screens/puzzle_creator_screen.dart';
import 'package:chuzzlez/screens/settings_screen.dart';
import 'screens/puzzles_list_screen.dart';
import 'screens/over_the_board_screen.dart';
import 'screens/login_screen.dart';

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
          create: (context) => PuzzlesProvider(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/home': (context) => HomeScreen(),
          '/board': (context) => BoardScreen(),
          '/puzzlelist': (context) => PuzzleListScreen(),
          '/overtheboard': (context) => OverTheBoard(),
          '/puzzlecreator': (context) => PuzzleCreator(),
          '/settings': (context) => Settings(),
          '/login': (context) => LoginScreen()
        },
        title: 'Chuzzlez',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF3dc2bf)),
      ),
    );
  }
}
