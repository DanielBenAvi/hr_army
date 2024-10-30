import 'package:flutter/material.dart';
import 'package:hr_army/components/text_form_field.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/model/user.dart';
import 'package:hr_army/themes.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key, required this.navigateTo});

  final void Function(String) navigateTo;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {
    "ID": "",
    "First Name": "",
    "Last Name": "",
    "Email": "",
    "Phone": "",
    "Battalion": "",
    "Company": "",
    "Platoon": "",
    "Class": "",
    "Role": "",
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var field in _formData.keys)
                  CustumeTextFormField(
                    labelText: field,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a $field";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData[field] = newValue!,
                  ),
                Padding(
                  padding: GlobalThemeData.globalPadding,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        value.addUser(User(
                          _formData["ID"]!,
                          _formData["First Name"]!,
                          _formData["Last Name"]!,
                          _formData["Email"]!,
                          _formData["Phone"]!,
                          _formData["Battalion"]!,
                          _formData["Company"]!,
                          _formData["Platoon"]!,
                          _formData["Class"]!,
                          _formData["Role"]!,
                        ));
                        // clear the form
                        _formKey.currentState!.reset();
                        widget.navigateTo("Users");
                      }
                    },
                    child: const Text("Add User"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
