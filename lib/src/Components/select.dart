import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  final String? value;
  final String hintText;
  final IconData prefixIcon;
  final Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;

  const Select(
      {Key? key,
      required this.value,
      required this.hintText,
      required this.prefixIcon,
      required this.onChanged,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey.shade600,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          floatingLabelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
          enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(4.0)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
        ),
        onChanged: onChanged,
        items: items,
      ),
    );
  }
}
