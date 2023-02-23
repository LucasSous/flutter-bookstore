import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? initialValue;
  final IconData icon;
  final String? Function(String?) validation;
  final Function(String?) onSaved;
  final Function()? onTap;
  final TextEditingController? controller;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const DefaultTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.initialValue,
      required this.icon,
      required this.validation,
      required this.onSaved,
      this.onTap,
      this.controller,
      this.readOnly,
      this.keyboardType,
      this.inputFormatters})
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
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
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
            TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
        floatingLabelStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium?.color,
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
