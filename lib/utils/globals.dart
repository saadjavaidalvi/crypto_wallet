import 'package:flutter/material.dart';

class GlobalContext {
  static late BuildContext context;

  void initalize(buildContext) {
    GlobalContext.context = buildContext;
  }
}

// Logger logger = Logger();
