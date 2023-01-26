import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listadeusuario/data/dummy_user.dart';
import 'package:listadeusuario/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};
  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
        id,
        () => User(
              id: id,
              name: user.name,
              email: user.email,
              avatarUrl: user.avatarUrl,
            ));
    notifyListeners();
  }
}