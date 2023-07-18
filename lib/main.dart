import 'package:flutter/material.dart';
import './random_words.dart';

// Entry function
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Scaffold is scaffolding which is kind of like a template
        theme: ThemeData(
          primaryColor: Colors.grey,
          appBarTheme: const AppBarTheme(
            color: Colors.grey,
          ),
          brightness: Brightness.light,
          fontFamily: 'Georgia',
        ),
        home: const RandomWords());
  }
}
