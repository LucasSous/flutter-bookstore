import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  final ThemeData _lightTheme = ThemeData(
      primaryColor: const Color(0xFF00B2D6),
      cardColor: Colors.grey.shade300,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme:
          InputDecorationTheme(fillColor: Colors.grey.shade200),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
      tabBarTheme: const TabBarTheme(labelColor: Colors.black),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        textColor: Colors.black,
        collapsedTextColor: Colors.black,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: const Color(0xFF00B2D6),
          primaryContainer: Colors.white,
          secondaryContainer: const Color(0xFF00B2D6),
          onSurface: Colors.black),
      shadowColor: Colors.black26,
      dividerColor: Colors.grey.shade300);

  final ThemeData _darkTheme = ThemeData(
      primaryColor: const Color(0xFF00B2D6),
      cardColor: const Color(0xFF3F3F3F),
      scaffoldBackgroundColor: const Color(0xFF2A2A2A),
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme:
          const InputDecorationTheme(fillColor: Color(0xFF3B3B3B)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2A2A2A),
          iconTheme: IconThemeData(
            color: Colors.grey,
          )),
      tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Colors.white, labelColor: Color(0xFF00B2D6)),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: Colors.grey,
        collapsedIconColor: Colors.grey,
        textColor: Colors.white,
        collapsedTextColor: Colors.white,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: const Color(0xFF00B2D6),
          primaryContainer: const Color(0xFF303030),
          secondaryContainer: const Color(0xFF00B2D6),
          onSurface: Colors.white),
      dialogTheme: const DialogTheme(
          backgroundColor: Color(
            0xFF4F4F4F,
          ),
          titleTextStyle: TextStyle(color: Colors.white),
          contentTextStyle: TextStyle(color: Colors.white)),
      shadowColor: Colors.black54,
      dividerColor: Colors.grey.shade700);

  bool isDark = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  changeTheme() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    brightness == Brightness.dark ? isDark = true : isDark = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: isDark ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: snackBarKey,
    );
  }
}
