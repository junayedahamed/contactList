import 'package:flutter/material.dart';

class Changetxt extends ChangeNotifier {
  bool _which = false;
  get what => _which;
  makeChange() {
    _which = !_which;
    notifyListeners();
  }
}
