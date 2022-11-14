import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey();

showSnackBar(message, status) {
  snackBarKey.currentState!.showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                  color: status == 'success' ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold),
            ),
          ),
          status == 'success'
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
      backgroundColor:
          status == 'success' ? Colors.green.shade100 : Colors.red.shade100,
      elevation: 5.0,
      behavior: SnackBarBehavior.fixed));
}
