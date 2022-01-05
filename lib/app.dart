import 'package:calculator_pizza/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/page_calculator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _pizzaTheme(),
      home: const Scaffold(
        body: PageCalculator(),
      ),
    );
  }
}

ThemeData _pizzaTheme() => ThemeData(
  splashColor: colorPizzaPink50,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
  ).copyWith(
    primary: colorPizzaPink300,
    onPrimary: colorPizzaBrown900,
    secondary: colorPizzaBrown700,
    surface: colorGrey200
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: colorPizzaBrown700),
    headline2: TextStyle(fontSize: 21, fontWeight: FontWeight.w600, color: colorPizzaBrown700),
    headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: colorPizzaBrown700),

  ),
);


