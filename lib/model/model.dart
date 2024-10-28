import 'package:flutter/material.dart';

import 'package:hr_army/model/event.dart';
import 'package:hr_army/model/user.dart';

class Model extends ChangeNotifier {
  final List<User> users = [];
  Event event = Event("Event", "Description", "2021-01-01", "2021-01-02");

  // Model() {

  // }

  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }
}
