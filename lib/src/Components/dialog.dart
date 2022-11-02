import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

openDialog(
        {required BuildContext context,
        required Function()? confirm,
        required String title,
        required String message}) =>
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
                title: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                content: Text(message,
                    style: TextStyle(color: Colors.grey.shade800)),
                actions: [
                  TextButton(
                      child: const Text(
                        "Cancelar",
                        style: TextStyle(color: Color(0xff123142)),
                      ),
                      onPressed: () {
                        Modular.to.pop();
                      }),
                  TextButton(
                    onPressed: confirm,
                    child: const Text(
                      "Confirmar",
                      style: TextStyle(color: Color(0xff123142)),
                    ),
                  )
                ]));
