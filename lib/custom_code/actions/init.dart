// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart';
import 'package:android_power_manager/android_power_manager.dart';

Future init() async {
  var status = await Permission.ignoreBatteryOptimizations.status;
  if (status.isGranted) {
    // Check if the return value is not null before using it in a condition.
    bool? isIgnoring = await AndroidPowerManager.isIgnoringBatteryOptimizations;
    if (isIgnoring == false) {
      AndroidPowerManager.requestIgnoreBatteryOptimizations();
    }
  } else {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.ignoreBatteryOptimizations,
    ].request();
    if (statuses[Permission.ignoreBatteryOptimizations]!.isGranted) {
      AndroidPowerManager.requestIgnoreBatteryOptimizations();
    }
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
