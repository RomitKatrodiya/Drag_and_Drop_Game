import 'package:animal_puzzle_game/screens/game_page.dart';
import 'package:animal_puzzle_game/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "game_page": (context) => const GamePage()
      },
    ),
  );
}
