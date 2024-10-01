import 'package:flutter/material.dart';
import '/main.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Image.asset('packages/preferences/assets/headshot.png',
          package: App.pkg),
    );
  }
}
