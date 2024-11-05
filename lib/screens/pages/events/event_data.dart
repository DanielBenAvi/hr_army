import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/model/user.dart';
import 'package:provider/provider.dart';

class EventData extends StatefulWidget {
  const EventData({super.key, required this.eventIndex});

  final int eventIndex;

  @override
  State<EventData> createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {
  Map<User, bool> selectedUsers = {};

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event Name: ${value.events[widget.eventIndex].name}'),
                    Text(
                        'Event Dates: ${value.events[widget.eventIndex].startDate.day}/${value.events[widget.eventIndex].startDate.month}/${value.events[widget.eventIndex].startDate.year}-${value.events[widget.eventIndex].endDate.day}/${value.events[widget.eventIndex].endDate.month}/${value.events[widget.eventIndex].endDate.year}'),
                    Text(
                        'Event Duration: ${value.events[widget.eventIndex].endDate.difference(value.events[widget.eventIndex].startDate).inDays + 1} days'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // todo - pop up dialog to add participant from users
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Add Participants'),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: value.users.isEmpty
                                ? const Text('No users available')
                                : ListBody(
                                    children: value.users.map((e) {
                                      return CheckboxListTile(
                                        title: Text(
                                            '${e.firstName} ${e.lastName}'),
                                        value: selectedUsers[e] ?? false,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            selectedUsers[e] = value!;
                                          });
                                        },
                                      );
                                    }).toList(),
                                  ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Add'),
                              onPressed: () {
                                // todo - fix this
                                for (var user in selectedUsers.keys) {
                                  if (selectedUsers[user]!) {
                                    value.events[widget.eventIndex]
                                        .addParticipant(
                                            user, DateTime.now().toString());
                                  }
                                }
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Add participants'),
                )
              ],
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                // of users in the event
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                ],
                rows: value.events[widget.eventIndex].participants.map((e) {
                  return DataRow(
                    cells: [
                      DataCell(Text(e.id)),
                      DataCell(Text(e.user.firstName)),
                      DataCell(Text(e.user.lastName)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
