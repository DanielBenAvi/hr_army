import 'package:flutter/material.dart';
import 'package:hr_army/components/navigation/nav_button.dart';
import 'package:hr_army/components/navigation/nav_title.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    super.key,
    required this.selectedRoute,
    required this.navigateTo(String route),
  });

  final String selectedRoute;
  final void Function(String) navigateTo;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavigationButton(
          routeName: "Dashboard",
          onPressed: () =>
              widget.navigateTo('Dashboard'), // Navigate to Dashboard
          backgroundColor:
              getSelctedColor(context, 'Dashboard', widget.selectedRoute),
          textColor:
              getSelctedTextColor(context, 'Dashboard', widget.selectedRoute),
        ),
        const NavigationTitle(title: 'Users'),
        NavigationButton(
          routeName: "Users",
          onPressed: () => widget.navigateTo('Users'),
          backgroundColor:
              getSelctedColor(context, 'Users', widget.selectedRoute),
          textColor:
              getSelctedTextColor(context, 'Users', widget.selectedRoute),
        ),
        NavigationButton(
          routeName: "Add User",
          onPressed: () => widget.navigateTo('Add User'),
          backgroundColor:
              getSelctedColor(context, 'Add User', widget.selectedRoute),
          textColor:
              getSelctedTextColor(context, 'Add User', widget.selectedRoute),
        ),
        const NavigationTitle(title: 'Events'),
        NavigationButton(
          routeName: "Events",
          onPressed: () => widget.navigateTo('Events'),
          backgroundColor:
              getSelctedColor(context, 'Events', widget.selectedRoute),
          textColor:
              getSelctedTextColor(context, 'Events', widget.selectedRoute),
        ),
        NavigationButton(
          routeName: "Create Event",
          onPressed: () => widget.navigateTo('Create Event'),
          backgroundColor:
              getSelctedColor(context, 'Create Event', widget.selectedRoute),
          textColor: getSelctedTextColor(
              context, 'Create Event', widget.selectedRoute),
        ),
      ],
    );
  }
}
