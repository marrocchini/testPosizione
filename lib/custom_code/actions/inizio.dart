// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:workmanager/workmanager.dart';
import 'package:geolocator/geolocator.dart';

Future callbackDispatcher() async {
  await ritornaApiCall(["Chiamata al callbackdispatcher"]);
  Workmanager().executeTask((task, inputData) async {
    await ritornaApiCall(
        ["Inizio dell'escuzione del worker, per la prima volta"]);
    if (task == 'backgroundTask') {
      await fetchDataAndStoreLocally();
    }
    return Future.value(true);
  });
}

Future inizio() async {
  await ritornaApiCall(["Inizializzazione dell'action"]);
  Workmanager().initialize(callbackDispatcher);
  Workmanager().registerPeriodicTask(
    '1_hourly_task',
    'backgroundTask',
    frequency: Duration(minutes: 1),
  );
}

Future fetchDataAndStoreLocally() async {
  final now = DateTime.now();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  //Convert Position to String (or any other format suitable for your needs).
  String positionString = "${position.latitude}, ${position.longitude}";
  // Perform the API call with the latest position. Adjust 'ritornaApiCall' to accept position data if needed.
  await ritornaApiCall([positionString, now.toString()]);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
