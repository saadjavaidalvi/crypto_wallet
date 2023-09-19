import 'dart:io';

import 'package:flutter/material.dart';

class BaseInkWell extends StatelessWidget {
  const BaseInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.onTapDown,
    this.onTapUp,
  });
  final Widget child;
  final GestureTapCallback? onTap;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: onTap,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: child,
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: child,
      );
    }
  }
}/* 

Widget BaseInkWell({
  required Widget child,
  required GestureTapCallback? onTap,
  Function(TapDownDetails)? onTapDown,
  Function(TapUpDetails)? onTapUp,
}) {
  if (Platform.isIOS) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: child,
    );
  } else {
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
} */
