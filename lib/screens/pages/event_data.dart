import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:provider/provider.dart';

class EventData extends StatelessWidget {
  const EventData({super.key, required this.eventIndex});

  final int eventIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) {
        final event = value.events[eventIndex];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Event Name: ${event.name}'),
            Text(
                'Event Dates: ${event.startDate.day}/${event.startDate.month}/${event.startDate.year}-${event.endDate.day}/${event.endDate.month}/${event.endDate.year}'),
            Text(
                'Event Duration: ${event.endDate.difference(event.startDate).inDays + 1} days'),
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
                rows: event.participants.map((e) {
                  return DataRow(
                    cells: [
                      DataCell(Text(e.ID)),
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
