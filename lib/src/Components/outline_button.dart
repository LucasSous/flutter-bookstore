import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function() click;
  const OutlineButton(
      {Key? key,
      required this.text,
      required this.isLoading,
      required this.click})
      : super(key: key);

  loading(Text text) {
    if (isLoading) {
      return const Center(
        child: SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            color: Color(0xff123142),
            strokeWidth: 2.0,
          ),
        ),
      );
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primaryContainer),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: const BorderSide(color: Colors.grey, width: 1)))),
            onPressed: click,
            child: loading(Text(text,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium?.color)))));
  }
}
