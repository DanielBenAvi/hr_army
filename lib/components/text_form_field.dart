import 'package:flutter/material.dart';

class CustumeTextFormField extends StatelessWidget {
  const CustumeTextFormField({
    Key? key,
    required this.labelText,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  final String labelText;
  final String? Function(String?) validator;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          errorStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
