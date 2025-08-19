import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  Future<bool> call() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return false;
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      return false;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return false;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return false; // No connectivity detected
    } else {
      return false; // Default case if no connectivity is detected
    }
  }
}
