// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future<List<int>> shuffleBoard() async {
  // Add your function code here!
  List<int> numbersList = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  numbersList.shuffle();
  return numbersList;
}
