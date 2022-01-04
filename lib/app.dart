import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/page_calculator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: PageCalculator(),
      ),
    );
  }
}

