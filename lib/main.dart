//helllo there

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '/routes/routes.dart';

void main() {
  runApp(const Bootstrap());
}

class Bootstrap extends StatefulWidget {
  const Bootstrap({super.key});

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.getInitialRoute(),
      scrollBehavior: const AppScrollBehavior(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
