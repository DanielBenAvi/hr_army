import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
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
            padding: const EdgeInsets.all(8.0),
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
                  for (int i = 0; i < 7; i++)
                    DataColumn(
                      label: Text(
                        [
                          "ID",
                          "First Name",
                          "Last Name",
                          "Company",
                          "Platoon",
                          "Class",
                          "Role"
                        ][i],
                      ),
                    ),
                ],
                rows: value.users
                    .map((user) => DataRow(
                          cells: [
                            DataCell(Text(user.id.toString())),
                            DataCell(Text(user.firstName)),
                            DataCell(Text(user.lastName)),
                            DataCell(Text(user.company)),
                            DataCell(Text(user.platoon)),
                            DataCell(Text(user.class_)),
                            DataCell(Text(user.role)),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
