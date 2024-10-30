import 'package:flutter/material.dart';
import 'package:hr_army/components/navigation/nav_bar.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/screens/pages/users/add_user.dart';
import 'package:hr_army/screens/pages/events/create_event.dart';
import 'package:hr_army/screens/pages/dashboard.dart';
import 'package:hr_army/screens/pages/events/events.dart';
import 'package:hr_army/screens/pages/users/users.dart';
import 'package:hr_army/themes.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedRoute = "Dashboard";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => MaterialApp(
        themeMode: ThemeMode.dark,
        theme: GlobalThemeData.darkThemeData,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("HR Management System"),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyNavigationBar(
                selectedRoute: _selectedRoute,
                navigateTo: _navigateTo,
              ),
              Expanded(
                child: Padding(
                  padding: GlobalThemeData.globalPadding,
                  child: _routesWidgetMap[_selectedRoute] ??
                      const Center(child: Text("No route selected")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateTo(String route) {
    setState(() {
      _selectedRoute = route;
    });
  }

  Map<String, Widget> get _routesWidgetMap {
    return {
      "Dashboard": const Dashboard(),
      "Users": const Users(),
      "Add User": AddUser(navigateTo: _navigateTo),
      "Events": const Events(),
      "Create Event": CreateEvent(navigateTo: _navigateTo),
    };
  }
}
