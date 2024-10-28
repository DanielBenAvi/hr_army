import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_army/model/model.dart';

import 'package:hr_army/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Model(),
      child: const Homepage(),
    ),
  );
}
