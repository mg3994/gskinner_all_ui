import 'package:core/core.dart';
import 'package:flutter/material.dart';

import './demo.dart';
import 'app_colors.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static final String _pkg = 'spending_tracker';

  static String? get pkg => Env.getPackage(_pkg);

  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    _appScale = MediaQuery.sizeOf(context).height / 480;
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: SpendingTrackerDemo(),
    );
  }
}

double get appScale => _appScale;
double _appScale = 1;

/// Shared styles
final text1 = TextStyle(
  color: AppColors.colorText1,
  fontFamily: 'Lato',
  fontSize: 12,
  fontWeight: FontWeight.w200,
);
final text2 = TextStyle(
  color: AppColors.colorText2,
  fontFamily: 'Lato',
  fontSize: 12,
  fontWeight: FontWeight.w200,
);
