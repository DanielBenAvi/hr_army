import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/themes.dart';
import 'package:provider/provider.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        // _searchQuery = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: GlobalThemeData.globalPadding,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
                  for (var header in headers) DataColumn(label: Text(header))
                ],
                rows: value.users
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(Text(user.id.toString())),
                          DataCell(Text(user.firstName)),
                          DataCell(Text(user.lastName)),
                          DataCell(Text(user.company)),
                          DataCell(Text(user.platoon)),
                          DataCell(Text(user.class_)),
                          DataCell(Text(user.role)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> headers = [
    "ID",
    "First Name",
    "Last Name",
    "Company",
    "Platoon",
    "Class",
    "Role"
  ];
}
