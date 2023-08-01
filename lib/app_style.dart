import 'package:flutter/material.dart';

class AppStyle with ChangeNotifier {
  AppStyle();

  Color? _color;
  TextTheme? textTheme;
  int layoutInt = 1;

  // Color get color => _color ?? Color.fromARGB(255, 255, 140, 0);
  Color get color => _color ?? Color.fromARGB(255, 255, 0, 0);
  Color? get nullableColor => _color;

  void changeColor(Color color) {
    _color = color;
    notifyListeners();
  }

  void changeTextTheme(TextTheme textTheme) {
    this.textTheme = textTheme;
    notifyListeners();
  }

  void changeLayout(int num) {
    if (num != layoutInt) {
      layoutInt = num;
      notifyListeners();
    }
  }
}
