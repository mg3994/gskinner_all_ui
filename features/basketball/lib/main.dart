import 'package:flutter/material.dart';

import 'package:core/core.dart';

import './demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = "basketball_ptr";

  const App({super.key});
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    return BasketballPTRDemo();
  }
}
