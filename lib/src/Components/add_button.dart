import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddButton extends StatelessWidget {
  final String route;
  const AddButton({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => {Modular.to.pushNamed(route)},
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add),
    );
  }
}
