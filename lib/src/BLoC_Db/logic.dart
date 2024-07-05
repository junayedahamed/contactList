import 'package:flutter/material.dart';

class Db extends ChangeNotifier {
  Db();
  final List _name = [];
  final List _number = [];

  get item1 => _name;
  get item2 => _number;

  void add(List value) {
    _name.add(value[0]);
    _number.add(value[1]);

    value.clear();

    notifyListeners();
    // print(_item1);
    // print(_item2);
  }

  delete(index) {
    _name.removeAt(index);
    _number.removeAt(index);
    notifyListeners();
  }

  // get indexs => _index;
  // indexnum(index) {
  //   _index = index;
  // }
}

class ToggleSwitch extends ChangeNotifier {
  ToggleSwitch._();
  static ToggleSwitch instance = ToggleSwitch._();
  get themeIcon {
    if (themeMode == ThemeMode.light) {
      return const Icon(Icons.light_mode);
    } else {
      return const Icon(Icons.dark_mode);
    }
  }

  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;
  changeTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
