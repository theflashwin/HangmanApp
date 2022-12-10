import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loseScreen(bool visible) {
  return Visibility(
    visible: visible,
    child: Container(
    width: 250,
    height: 250,
    decoration: BoxDecoration(
      color: Colors.red[400],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'You Lost!',
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