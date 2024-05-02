// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/scheduler.dart';

import 'dart:async';

import 'dart:io';
import 'dart:convert';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/gestures.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:background_fetch/background_fetch.dart';

Future mainAction() async {
  // Step 1:  Configure BackgroundFetch as usual.
  int status = await BackgroundFetch.configure(BackgroundFetchConfig(
    minimumFetchInterval: 15
  ), (String taskId) async {  // <-- Event callback.
    // This is the fetch-event callback.
    print("[BackgroundFetch] taskId: $taskId");
  
    // Use a switch statement to route task-handling.
    switch (taskId) {
      case 'com.transistorsoft.customtask':
        final now = DateTime.now();
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
        //Convert Position to String (or any other format suitable for your needs).
        String positionString = "${position.latitude}, ${position.longitude}";
        await ritornaApiCall([positionString],now.toString()]);
        break;
      default:
        print("Default fetch task");
    }
    // Finish, providing received taskId.
    BackgroundFetch.finish(taskId);
  }, (String taskId) async {  // <-- Event timeout callback
    // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] TIMEOUT taskId: $taskId");
    BackgroundFetch.finish(taskId);
  });
  
  // Step 2:  Schedule a custom "oneshot" task "com.transistorsoft.customtask" to execute 5000ms from now.
  BackgroundFetch.scheduleTask(TaskConfig(
    taskId: "com.transistorsoft.customtask",
    delay: 5000  // <-- milliseconds
  ));
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
