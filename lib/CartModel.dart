import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  bool connected = false;

  void connect()
  {
    connected = true;
    notifyListeners();
  }

  void disconnect()
  {
    connected = false;
    notifyListeners();
  }
}
