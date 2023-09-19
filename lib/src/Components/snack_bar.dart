import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey();

enum Status {
  error,
  success,
}

void showSnackBar(String message, Status status) {
  snackBarKey.currentState!.showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                  color: status == Status.success ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
          status == Status.success
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.red,
                )
        ],
      ),
      backgroundColor: status == Status.success
          ? Colors.green.shade100
          : Colors.red.shade100,
      elevation: 5.0,
      behavior: SnackBarBehavior.fixed));
}
