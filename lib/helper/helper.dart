import 'dart:math';
import 'package:random_name_generator/random_name_generator.dart';

String randomID() {
  // new 9 digit random number
  return (100000000 + Random().nextInt(900000000)).toString();
}

String randomFirstName() {
  var rnd = RandomNames(Zone.israel);
  return rnd.manName();
}

String randomLastName() {
  var rnd = RandomNames(Zone.israel);
  return rnd.surname();
}
