import 'package:flutter/material.dart';
import 'package:hr_army/components/nav_button.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/screens/pages/add_user.dart';
import 'package:hr_army/screens/pages/create_event.dart';
import 'package:hr_army/screens/pages/dashboard.dart';
import 'package:hr_army/screens/pages/events.dart';
import 'package:hr_army/screens/pages/users.dart';
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
        themeMode: ThemeMode.light,
        theme: GlobalThemeData.lightThemeData,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("HR Management System"),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var route in _routesWidgetMap.keys)
                    NavigationButton(
                      routeName: route,
                      onPressed: () => _navigateTo(route),
                      backgroundColor: _selectedRoute == route
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      textColor: _selectedRoute == route
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                ],
              ),
              Padding(
                padding: GlobalThemeData.globalPadding,
                child: Divider(
                  color: Theme.of(context).colorScheme.onSurface,
                  thickness: 3,
                  height: 100,
                ),
              ),

              // Display the selected route
              Expanded(
                child: Padding(
                  padding: GlobalThemeData.globalPadding,
                  child: _routesWidgetMap[_selectedRoute]!,
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
