import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman/ui/Colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.white30,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        )
      ),
    )
  );
}