import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  bool _connectedToInternet = false;
  bool get connectedToInternet => _connectedToInternet;

  void connectionChanged(bool state) {
    _connectedToInternet = state;
    notifyListeners();
  }
}
