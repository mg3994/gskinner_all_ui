import 'package:core/core.dart';
import 'package:flutter/material.dart';
import './demo.dart';

void main() => runApp(const App());


class App extends StatelessWidget {

  static String _pkg = "dark_ink_transition";

  const App({super.key});
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(context) {
    return const MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: DarkInkDemo(),
    );
  }
}
