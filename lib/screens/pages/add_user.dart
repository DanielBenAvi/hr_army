import 'package:flutter/material.dart';
import 'package:hr_army/model/model.dart';
import 'package:hr_army/model/user.dart';
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
      builder: (context, value, child) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // final String _id;
                  TextFormField(
                    decoration: const InputDecoration(labelText: "ID"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter an ID";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["ID"] = newValue!,
                  ),
                  // final String _firstName;
                  TextFormField(
                    decoration: const InputDecoration(labelText: "First Name"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a first name";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["First Name"] = newValue!,
                  ),
                  // final String _lastName;
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Last Name"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a last name";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Last Name"] = newValue!,
                  ),
                  // final String _email;
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter an email";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Email"] = newValue!,
                  ),
                  // final String _phone;
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Phone"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a phone number";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Phone"] = newValue!,
                  ),
                  // final String _battalion; // גדוד
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Battalion"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a battalion";
                      }
                      return null;
                    },
                  ),

                  // final String _company; // פלוגה
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Company"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a company";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Company"] = newValue!,
                  ),
                  // final String _platoon; // מחלקה
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Platoon"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a platoon";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Platoon"] = newValue!,
                  ),
                  // final String _class; // כיתה
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Class"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a class";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Class"] = newValue!,
                  ),
                  // final String _role; // תפקיד
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Role"),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please enter a role";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _formData["Role"] = newValue!,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
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

                          // TODO go to the users page with the easy_sidemenu
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
      ),
    );
  }
}
