import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/screens/pages/events/event_data.dart';
import 'package:hr_army/themes.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  int eventIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => value.events.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: GlobalThemeData.globalPadding,
                  child: Row(
                    children: [
                      const Text('Choose Event'),
                      const SizedBox(width: 10),
                      DropdownButton(
                          value: eventIndex,
                          items: value.events.map((e) {
                            return DropdownMenuItem(
                              value: value.events.indexOf(e),
                              child: Text(e.name),
                            );
                          }).toList(),
                          onChanged: (int? value) {
                            if (value != null) {
                              setState(() {
                                eventIndex = value;
                              });
                            }
                          })
                    ],
                  ),
                ),
                // This is the EventData widget
                EventData(eventIndex: eventIndex),
              ],
            )
          : const Center(child: Text('No events available')),
    );
  }
}
