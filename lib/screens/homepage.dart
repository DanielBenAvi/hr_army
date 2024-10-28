import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/screens/pages/add_user.dart';
import 'package:hr_army/screens/pages/dashboard.dart';
import 'package:hr_army/screens/pages/users.dart';
import 'package:hr_army/screens/pages/events.dart';
import 'package:provider/provider.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController pageController;
  late SideMenuController sideMenu;

  void changePage(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController();
    sideMenu = SideMenuController();

    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    sideMenu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("HR Management System"),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                style: sideMenuStyle(),
                items: items,
                controller: sideMenu,
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    // 4 pages
                    Dashboard(),
                    AddUser(changePage: changePage),
                    Users(),
                    Events(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SideMenuStyle sideMenuStyle() {
    return SideMenuStyle(
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
      hoverColor: Colors.lightBlue,
      itemOuterPadding: const EdgeInsets.all(4),
    );
  }

  List<dynamic> get items {
    return [
      // 4 items
      SideMenuItem(
        title: "Dashboard",
        icon: const Icon(Icons.dashboard),
        onTap: (index, controller) => sideMenu.changePage(index),
      ),
      SideMenuExpansionItem(
          title: "Users",
          icon: const Icon(Icons.people),
          children: [
            SideMenuItem(
              title: "Add User",
              icon: const Icon(Icons.person_add),
              onTap: (index, controller) => sideMenu.changePage(index),
            ),
            SideMenuItem(
              title: "Users",
              icon: const Icon(Icons.people),
              onTap: (index, controller) => sideMenu.changePage(index),
            ),
          ]),
      SideMenuItem(
        title: "Events",
        icon: const Icon(Icons.event),
        onTap: (index, controller) => sideMenu.changePage(index),
      ),
    ];
  }
}
