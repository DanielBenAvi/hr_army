import 'package:flutter/material.dart';
import 'package:hr_army/components/text_form_field.dart';
import 'package:hr_army/model/event.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/themes.dart';
import 'package:provider/provider.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key, required this.navigateTo});

  final void Function(String) navigateTo;

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {
    "name": "",
    "description": "",
  };

  DateTimeRange _selectedDateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustumeTextFormField(
              labelText: "Name",
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter a name";
                }
                return null;
              },
              onSaved: (newValue) => _formData["name"] = newValue!,
            ),
            CustumeTextFormField(
              labelText: "Description",
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter a description";
                }
                return null;
              },
              onSaved: (newValue) => _formData["description"] = newValue!,
            ),
            Padding(
              padding: GlobalThemeData.globalPadding,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final newDateRange = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        initialDateRange: _selectedDateRange,
                      );

                      if (newDateRange != null) {
                        setState(() {
                          _selectedDateRange = newDateRange;
                        });
                      }
                    },
                    child: const Text("Select Date Range"),
                  ),
                  const SizedBox(width: 20),
                  Text(
                      "${_selectedDateRange.start.day} / ${_selectedDateRange.start.month} / ${_selectedDateRange.start.year}"
                      " - ${_selectedDateRange.end.day} / ${_selectedDateRange.end.month} / ${_selectedDateRange.end.year}"),
                  const SizedBox(width: 20),
                  Text("Total days: ${_selectedDateRange.duration.inDays + 1}"),
                ],
              ),
            ),
            Padding(
              padding: GlobalThemeData.globalPadding,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    value.createEvent(
                      Event(
                        _formData["name"]!,
                        _formData["description"]!,
                        _selectedDateRange.start,
                        _selectedDateRange.end,
                      ),
                    );
                    // clear the form
                    _formKey.currentState!.reset();

                    widget.navigateTo("Events");
                  }
                },
                child: const Text("Create Event"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
