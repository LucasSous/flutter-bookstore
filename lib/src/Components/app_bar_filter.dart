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
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: "Pesquisar",
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).iconTheme.color,
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true, //<-- SEE HERE
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4.0)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
      leadingWidth: 30,
      shape: Border(
        bottom: BorderSide(
            width: 1, color: Colors.grey.shade500, style: BorderStyle.solid),
      ),
    );
  }
}
