import 'package:flutter/material.dart';

class AppBarFilter extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFilter({Key? key, required this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: 40,
        child: TextField(
          onChanged: onChanged,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Pesquisar",
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            filled: true, //<-- SEE HERE
            fillColor: Colors.grey.shade200,
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4.0)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
      leading: const BackButton(color: Colors.black),
      leadingWidth: 30,
      backgroundColor: Colors.white,
      shape: Border(
        bottom: BorderSide(
            width: 1, color: Colors.grey.shade500, style: BorderStyle.solid),
      ),
    );
  }
}
