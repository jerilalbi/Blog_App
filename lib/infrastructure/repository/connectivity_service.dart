class ConnectivityService {
  ConnectivityService._privateConstructor();
  static final ConnectivityService _instance =
      ConnectivityService._privateConstructor();
  static ConnectivityService get instance => _instance;

  bool isOnline = false;

  void updateStatus(bool status) {
    isOnline = status;
  }
}
