import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = "constellations_list";
  static String? get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: ConstellationsListDemo(),
    );
  }
}
