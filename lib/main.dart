import 'package:flutter/material.dart';

import 'app.dart';
import 'locator.dart';

Future<void> main() async {
  await setupLocator();

  runApp(App());
}
