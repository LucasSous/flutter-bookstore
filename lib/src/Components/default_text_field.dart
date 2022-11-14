import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? initialValue;
  final IconData icon;
  final String? Function(String?) validation;
  final Function(String?) onSaved;
  final Function()? onTap;
  final TextEditingController? controller;
  const DefaultTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.initialValue,
      required this.icon,
      required this.validation,
      required this.onSaved,
      this.onTap,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validation,
      onSaved: onSaved,
      controller: controller,
      onTap: onTap,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
      decoration: InputDecoration(
        labelText: labelText,
        filled: true, //<-- SEE HERE
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.grey.shade600,
        ),
        labelStyle:
            TextStyle(color: Theme.of(context).textTheme.bodyText2?.color),
        floatingLabelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText2?.color,
            fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(color: Colors.grey),
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
