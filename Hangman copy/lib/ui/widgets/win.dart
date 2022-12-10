import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/game.dart';

Widget winScreen(String word) {

  return Visibility(
    visible: check(word),
    child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'You Won!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Press the reload button to play again!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    ),
  );

}

bool check(String word) {

  if(Game.tries >= 6) return false;

  for(String str in word.split("")) {
    print(str);
    if(!Game.selectedChars.contains(str.toUpperCase())) {
      return false;
    }
  }

  return true;

}