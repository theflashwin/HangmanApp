import 'package:flutter/material.dart';
import 'package:hangman/ui/Colors.dart';
import 'package:hangman/ui/Words.dart';
import 'package:hangman/ui/widgets/figure.dart';
import 'package:hangman/ui/widgets/letter.dart';
import 'package:hangman/ui/widgets/lose.dart';
import 'package:hangman/ui/widgets/win.dart';
import 'package:hangman/util/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key : key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomeApp(),
    );

  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key : key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {


  String word = Game.getWord();

  //for testing
  // String word = "flutter";

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        leading: GestureDetector(
          onTap: () {
            setState(() {
              Game.selectedChars = [];
              Game.tries = 0;
              word = Game.getWord();
            });
          },
          child: const Icon(
            Icons.refresh,
              size: 40
          ),
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/hang.png'),
                figureImage(Game.tries >= 1, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/head.png'),
                figureImage(Game.tries >= 2, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/body.png'),
                figureImage(Game.tries >= 3, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/ra.png'),
                figureImage(Game.tries >= 4, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/la.png'),
                figureImage(Game.tries >= 5, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/rl.png'),
                // figureImage(Game.tries >= 6, 'https://raw.githubusercontent.com/doctorcode9/hangman_flutter/main/assets/ll.png'),
                loseScreen(Game.tries >= 6),
                winScreen(word),
              ],
            )
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word.split("").map((e) => letter(e.toUpperCase(), !Game.selectedChars.contains(e.toUpperCase()))).toList()
          ),

          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
                crossAxisCount: 7,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              padding: EdgeInsets.all(10.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChars.contains(e.toUpperCase())
                      ? null
                      : () {
                            setState(() {
                              Game.selectedChars.add(e);
                              print(Game.selectedChars);
                              if(!word.split('').contains(e.toLowerCase())) {
                                Game.tries++;
                              }
                            });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  fillColor: Game.selectedChars.contains(e)?Colors.black87:Colors.indigoAccent,
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 25
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }
}