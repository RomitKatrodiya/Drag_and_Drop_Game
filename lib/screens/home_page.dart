import 'package:flutter/material.dart';

import '../global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/animals/game.jpg",
            ),
          ),
        ),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Global.list = Global.animals;
                Global.image = "assets/animals/forest.jpg";
                Navigator.of(context).pushNamed("game_page");
              },
              child:
                  gameContainer("Animals Game", "assets/animals/animals.png"),
            ),
            InkWell(
              onTap: () {
                Global.list = Global.fruits;
                Global.image = "assets/fruits/fruit_background.jpg";
                Navigator.of(context).pushNamed("game_page");
              },
              child: gameContainer("Fruits Game", "assets/fruits/fruits.png"),
            ),
          ],
        ),
      ),
    );
  }

  gameContainer(name, image) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.brown.shade700, width: 5),
      ),
      child: Column(
        children: [
          SizedBox(height: 210, child: Image.asset(image)),
          Text(
            name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.brown.shade700,
            ),
          )
        ],
      ),
    );
  }
}
