import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setTimeout();
    super.initState();
  }

  void setTimeout() {
    Duration timeDelay = const Duration(milliseconds: 3000);
    Timer(timeDelay, () {
      Modular.to.navigate('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Color(0xFF00B2D6),
      )),
    );
  }
}
