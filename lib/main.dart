import 'package:flutter/cupertino.dart';
import 'package:flutter_bookstore2/src/app_modlule.dart';
import 'package:flutter_bookstore2/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModlule(), child: const AppWidget()));
}
