import 'package:core/core.dart';
import 'package:flutter/material.dart';

import './demo.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  static const String _pkg = 'indie_3d';

  const App({super.key});
  static String? get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(context) {
    return const MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Indie3dHome(),
    );
  }
}
