import 'package:flutter/material.dart';

class DefaultTitle extends StatelessWidget {
  final String text;
  const DefaultTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyText2?.color));
  }
}
