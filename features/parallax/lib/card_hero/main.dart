import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'demo.dart';
import 'demo_data.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = "parallax_travel_cards_hero";
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Hero Travel Card',
      theme: ThemeData(brightness: Brightness.light),
      home: HeroCardDemo(
        city: DemoData().getCity(),
      ),
    );
  }
}
