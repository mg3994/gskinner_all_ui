import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  static String _pkg = "bubble_tab_bar";

  const App({super.key});
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: BubbleTabBarDemo(),
    );
  }
}
