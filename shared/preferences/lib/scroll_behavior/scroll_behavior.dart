import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

final class AntinnaScrollBehavior extends MaterialScrollBehavior {
  const AntinnaScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices {
 
    return Set<PointerDeviceKind>.from(super.dragDevices)..add(PointerDeviceKind.mouse);
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
