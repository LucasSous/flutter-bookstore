import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function()? function;
  const HomePage({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function, child: const Text('Click'));
  }
}
