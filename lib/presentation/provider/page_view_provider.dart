
import 'package:flutter/material.dart';

class PageViewProvider with ChangeNotifier{
  int current = 0;
  currentIndex(int value) {
    current = value;
    notifyListeners();
  }
}