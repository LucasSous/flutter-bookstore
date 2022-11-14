import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Function()? search;
  final double? elevation;
  final bool? border;

  const DefaultAppBar(
      {super.key, this.title, this.search, this.elevation, this.border});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultTitle(text: title ?? ''),
      centerTitle: true,
      elevation: elevation ?? 1,
      leading: IconButton(
        onPressed: () {
          Modular.to.pushNamed('/menu');
        },
        icon: const Icon(Icons.menu),
      ),
      shape: border == true
          ? Border(
              bottom: BorderSide(
                  width: 1,
                  color: Colors.grey.shade500,
                  style: BorderStyle.solid),
            )
          : null,
      actions: <Widget>[
        IconButton(
          onPressed: search,
          icon: const Icon(Icons.search),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
