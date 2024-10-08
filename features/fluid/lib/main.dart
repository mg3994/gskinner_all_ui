import 'package:core/core.dart';
import 'package:flutter/material.dart';

import './demo.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: FluidNavBarDemo(),
    );
  }
}
