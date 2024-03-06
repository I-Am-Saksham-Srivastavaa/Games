import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
    _safeInit(() {
      _isMusicEnabled = prefs.getBool('ff_isMusicEnabled') ?? _isMusicEnabled;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_audioRef')) {
        try {
          _audioRef = jsonDecode(prefs.getString('ff_audioRef') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool _value) {
    _navOpen = _value;
    prefs.setBool('ff_navOpen', _value);
  }

  bool _isMusicEnabled = true;
  bool get isMusicEnabled => _isMusicEnabled;
  set isMusicEnabled(bool _value) {
    _isMusicEnabled = _value;
    prefs.setBool('ff_isMusicEnabled', _value);
  }

  bool _isFavourite = false;
  bool get isFavourite => _isFavourite;
  set isFavourite(bool _value) {
    _isFavourite = _value;
  }

  dynamic _audioRef;
  dynamic get audioRef => _audioRef;
  set audioRef(dynamic _value) {
    _audioRef = _value;
    prefs.setString('ff_audioRef', jsonEncode(_value));
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
