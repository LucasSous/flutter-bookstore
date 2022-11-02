import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function() click;
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.isLoading,
      required this.click})
      : super(key: key);

  loading() {
    if (isLoading) {
      return const Center(
        child: SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.0,
          ),
        ),
      );
    } else {
      return Text(text, style: const TextStyle(fontSize: 16));
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
                  Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            onPressed: click,
            child: loading()));
  }
}
