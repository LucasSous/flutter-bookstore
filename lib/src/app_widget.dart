import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          primaryColor: const Color(0xff123142),
          backgroundColor: const Color(0xffEEEEEE)),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: snackBarKey,
    );
  }
}
