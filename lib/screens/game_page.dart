import 'package:animal_puzzle_game/modal.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int score = 0;
  int gameOver = 0;
  List<Content> list2 = [];

  @override
  void initState() {
    super.initState();
    for (var e in Global.list) {
      list2.add(e);
    }
    list2.shuffle();

    for (var e in Global.list) {
      e.isDropped = false;
    }
    for (var e in list2) {
      e.isDropped = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.16;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.87,
              image: AssetImage(Global.image),
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: Global.list.map((e) {
                          int i = list2.indexOf(e);
                          return Global.list[i].isDropped == true
                              ? Container(
                                  height: height,
                                )
                              : Draggable(
                                  data: Global.list[i].value,
                                  childWhenDragging: Container(
                                    height: height,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      Global.list[i].image,
                                    ),
                                  ),
                                  feedback: SizedBox(
                                      height: height,
                                      child: Image.asset(Global.list[i].image)),
                                  child: Container(
                                    height: height,
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      Global.list[i].image,
                                    ),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: list2.map((e) {
                          int i = list2.indexOf(e);
                          return list2[i].isDropped == true
                              ? Container(
                                  height: height,
                                )
                              : DragTarget(
                                  onAccept: (data) {
                                    if (list2[i].value == data) {
                                      setState(() {
                                        for (var e in Global.list) {
                                          if (e.value == list2[i].value) {
                                            e.isDropped = true;
                                          }
                                        }
                                        list2[i].isDropped = true;
                                        score += 10;
                                        gameOver++;
                                        if (gameOver == Global.list.length) {
                                          showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (context) {
                                                return dialog();
                                              });
                                        }
                                      });
                                    } else {
                                      setState(() {
                                        score -= 5;
                                      });
                                    }
                                  },
                                  builder: (context, a, r) => Container(
                                    height: height,
                                    alignment: Alignment.center,
                                    child: Text(
                                      list2[i].value,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            color: Colors.brown.shade900,
                                            blurRadius: 30,
                                          ),
                                          const Shadow(
                                            color: Colors.black87,
                                            blurRadius: 10,
                                          ),
                                          const Shadow(
                                            color: Colors.black,
                                            blurRadius: 25,
                                          ),
                                        ],
                                        letterSpacing: 1.5,
                                        color: Colors.yellow.shade800,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.all(12),
                child: Text(
                  "  Your Score : $score",
                  style: TextStyle(
                    color: Colors.brown.shade700,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dialog() {
    return AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.brown.shade800,
          width: 5,
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      title: Center(
        child: Text(
          "Game Over",
          style: TextStyle(
            fontSize: 35,
            color: Colors.brown.shade800,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Text(
        textAlign: TextAlign.center,
        "- Your Score -\n$score",
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/");
                },
                child: Icon(Icons.home, color: Colors.brown.shade700),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    Global.list.shuffle();
                    list2.shuffle();
                    for (var e in Global.list) {
                      e.isDropped = false;
                    }
                    for (var e in list2) {
                      e.isDropped = false;
                    }
                    score = 0;
                    gameOver = 0;
                  });
                },
                child: Text("Restart",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown.shade700,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
