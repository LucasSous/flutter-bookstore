import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? initialValue;
  final IconData icon;
  final String? Function(String?) validation;
  final Function(String?) onSaved;
  const DefaultTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.initialValue,
      required this.icon,
      required this.validation,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validation,
      onSaved: onSaved,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true, //<-- SEE HERE
        fillColor: Colors.grey.shade200,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.grey.shade600,
        ),
        floatingLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(4.0)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
