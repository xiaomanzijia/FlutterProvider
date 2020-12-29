import 'package:flutter/widgets.dart';

class Model1 extends ChangeNotifier {

  int _count = 1;

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }
}