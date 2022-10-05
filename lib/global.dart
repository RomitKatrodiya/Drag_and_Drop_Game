import 'package:animal_puzzle_game/modal.dart';

class Global {
  static List<Content> list = [];
  static String image = "";

  static List<Content> animals = [
    Content(value: "Cow", image: "assets/animals/cow.png", isDropped: false),
    Content(
        value: "Elephant",
        image: "assets/animals/elephant.png",
        isDropped: false),
    Content(
        value: "Horse", image: "assets/animals/horse.png", isDropped: false),
    Content(
        value: "Monkey", image: "assets/animals/monkey.png", isDropped: false),
    Content(
        value: "Panda", image: "assets/animals/panda.png", isDropped: false),
  ];

  static List<Content> fruits = [
    Content(value: "Apple", image: "assets/fruits/apple.png", isDropped: false),
    Content(
        value: "Banana", image: "assets/fruits/banana.png", isDropped: false),
    Content(value: "Greps", image: "assets/fruits/greps.png", isDropped: false),
    Content(value: "Kiwi", image: "assets/fruits/kiwi.png", isDropped: false),
    Content(
        value: "Watermelon",
        image: "assets/fruits/watermelon.png",
        isDropped: false),
  ];
}
