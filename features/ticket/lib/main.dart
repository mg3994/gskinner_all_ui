import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = "ticket_fold";
  static String? get pkg => Env.getPackage(_pkg);

  @override
  Widget build(BuildContext context) {
    const title = 'Ticket Fold Demo';
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: title,
      home: TicketFoldDemo(),
    );
  }
}
