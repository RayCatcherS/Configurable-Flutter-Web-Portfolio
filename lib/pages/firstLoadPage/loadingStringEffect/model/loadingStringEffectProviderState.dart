import 'package:flutter/material.dart';

class LoadingStringEffectProviderState extends ChangeNotifier {
  


  String stringLine1 = "> ";
  String _line1Part1 = "loading data from: ${Uri.base.scheme}://${Uri.base.authority}";
  String _donestr = "DONE";

  String stringLine2 = "";
  String _line2Part1 = "> ";
  String _line2Part2 = "the web app portfolio is loading";


  


  void startLoadigPageStringTransition() async {
    final int millisecondsCursorTime = 200;
    final int millisecondsCharTime = 25;


    Stopwatch s = new Stopwatch(); // execution timer
    s.start();
    double emptyFirstLineWTMs = 1700; // empty first line waiting time
    double emptySecondLineWTMs = 500; // empty first line waiting time
    double tTargetMs = 0; // time target


    // line init
    _line2Part2 = _line2Part2;

    // blinking cursor
    tTargetMs = s.elapsedMilliseconds + emptyFirstLineWTMs;
    stringLine1 = stringLine1 + " ";
    while(s.elapsedMilliseconds < tTargetMs) {

      stringLine1 = stringLine1.replaceRange(stringLine1.length - 1, null, "▍");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      stringLine1 = stringLine1.replaceRange(stringLine1.length - 1, null, " ");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
    }
    stringLine1 = stringLine1.substring(0, stringLine1.length - 1);


    // print first line
    for(int i = 0; i < _line1Part1.length; i++) {
      stringLine1 = stringLine1 + _line1Part1[i];
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCharTime));
    }
    
    // blinking cursor
    tTargetMs = s.elapsedMilliseconds + emptyFirstLineWTMs;
    stringLine1 = stringLine1 + " ";
    while(s.elapsedMilliseconds < tTargetMs) {

      stringLine1 = stringLine1.replaceRange(stringLine1.length - 1, null, "▍");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      stringLine1 = stringLine1.replaceRange(stringLine1.length - 1, null, " ");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
    }


    // add the DONE string
    await Future.delayed(Duration(milliseconds: 300));
    stringLine1 = stringLine1 + "DONE";
    


    // second line 
    stringLine2 = _line2Part1;



    // blinking cursor
    tTargetMs = s.elapsedMilliseconds + emptySecondLineWTMs;
    stringLine2 = stringLine2 + " ";
    while(s.elapsedMilliseconds < tTargetMs) {

      stringLine2 = stringLine2.replaceRange(stringLine2.length - 1, null, "▍");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      stringLine2 = stringLine2.replaceRange(stringLine2.length - 1, null, " ");
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
    }
    stringLine2 = stringLine2.substring(0, stringLine2.length - 1);


    // print second line
    for(int i = 0; i < _line2Part2.length; i++) {
      stringLine2 = stringLine2 + _line2Part2[i];
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCharTime));
    }


    // blinking cursor
    tTargetMs = s.elapsedMilliseconds + emptySecondLineWTMs;
    while(s.elapsedMilliseconds < double.infinity) {

      stringLine2 = stringLine2 + "   ";
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      stringLine2 = stringLine2.substring(0, stringLine2.length - 3);


      stringLine2 = stringLine2 + ".  ";
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      stringLine2 = stringLine2.substring(0, stringLine2.length - 3);

      stringLine2 = stringLine2 + ".. ";
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      
      stringLine2 = stringLine2.substring(0, stringLine2.length - 3);

      stringLine2 = stringLine2 + "...";
      notifyListeners();
      await Future.delayed(Duration(milliseconds: millisecondsCursorTime));
      
      stringLine2 = stringLine2.substring(0, stringLine2.length - 3);
    }
  }
}