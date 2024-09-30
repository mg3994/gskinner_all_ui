import 'package:core/core.dart';
import 'package:flutter/material.dart';

import './content/home.dart';
import './content/account.dart';
import './content/grid.dart';
import './fluid_nav_bar.dart';

class FluidNavBarDemo extends StatefulWidget {
  const FluidNavBarDemo({super.key});

  static const routePath = '/fluid';

  static Route<void> route(RouteSettings? settings) {
    return MaterialPageRoute(
        settings: settings, builder: (context) => const FluidNavBarDemo());
  }

  @override
  State createState() {
    return _FluidNavBarDemoState();
  }
}

class _FluidNavBarDemoState extends State {
  Widget _child = const HomeContent();

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF75B7E1),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const HomeContent();
          break;
        case 1:
          _child = const AccountContent();
          break;
        case 2:
          _child = const GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
