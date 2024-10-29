import 'package:flutter/material.dart';

import 'package:hr_army/model/event.dart';
import 'package:hr_army/model/user.dart';

class Model extends ChangeNotifier {
  final List<User> users = [];
  final List<Event> events = [];

  void addUser(User user) {
    users.add(user);
    notifyListeners();
  }

  void createEvent(Event event) {
    events.add(event);
    notifyListeners();
  }
}
