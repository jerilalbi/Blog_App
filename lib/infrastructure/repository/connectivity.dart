import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

bool isConnected = false;

Future<bool> checkInternetConnection() async {
  Connectivity connectivity = Connectivity();
  final result = await connectivity.checkConnectivity();

  if (result.contains(ConnectivityResult.none)) {
    return false;
  } else {
    return true;
  }
}
