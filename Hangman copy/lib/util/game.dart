import '../ui/Words.dart';

class Game {
  static int tries = 0;
  static List<String> selectedChars = [];

  static String getWord() => (Words.words..shuffle()).first;


  // static bool checkWin() {
  //   for(String c : )
  //
  //   return false;
  //
  // }

}