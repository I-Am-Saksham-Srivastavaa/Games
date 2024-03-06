// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

Future initializeAudioPlayer(String url) async {
  final appDocDir = await getApplicationDocumentsDirectory();
  final filePath = '${appDocDir.path}/downloadedAudio.mp3';

  try {
    // Download the file
    final dio = Dio();
    await dio.download(url, filePath);

    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.setFilePath(filePath); // Set the file path of the audio

    // Save the audio player instance to app state
    FFAppState().audioRef = audioPlayer;
  } catch (e) {
    print("Error downloading or playing audio: $e");
  }
}
