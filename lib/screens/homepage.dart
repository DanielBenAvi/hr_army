import 'package:flutter/material.dart';
import 'package:hr_army/components/nav_button.dart';
import 'package:hr_army/components/nav_title.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavigationButton(
                    routeName: "Dashboard",
                    onPressed: () =>
                        _navigateTo('Dashboard'), // Navigate to Dashboard
                    backgroundColor:
                        getSelctedColor(context, 'Dashboard', _selectedRoute),
                    textColor: getSelctedTextColor(
                        context, 'Dashboard', _selectedRoute),
                  ),
                  const NavigationTitle(title: 'Users'),
                  NavigationButton(
                    routeName: "Users",
                    onPressed: () => _navigateTo('Users'),
                    backgroundColor:
                        getSelctedColor(context, 'Users', _selectedRoute),
                    textColor:
                        getSelctedTextColor(context, 'Users', _selectedRoute),
                  ),
                  NavigationButton(
                    routeName: "Add User",
                    onPressed: () => _navigateTo('Add User'),
                    backgroundColor:
                        getSelctedColor(context, 'Add User', _selectedRoute),
                    textColor: getSelctedTextColor(
                        context, 'Add User', _selectedRoute),
                  ),
                  const NavigationTitle(title: 'Events'),
                  NavigationButton(
                    routeName: "Events",
                    onPressed: () => _navigateTo('Events'),
                    backgroundColor:
                        getSelctedColor(context, 'Events', _selectedRoute),
                    textColor:
                        getSelctedTextColor(context, 'Events', _selectedRoute),
                  ),
                  NavigationButton(
                    routeName: "Create Event",
                    onPressed: () => _navigateTo('Create Event'),
                    backgroundColor: getSelctedColor(
                        context, 'Create Event', _selectedRoute),
                    textColor: getSelctedTextColor(
                        context, 'Create Event', _selectedRoute),
                  ),
                ],
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
