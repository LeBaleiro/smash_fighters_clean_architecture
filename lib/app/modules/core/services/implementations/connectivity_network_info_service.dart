import 'package:connectivity/connectivity.dart';

import '../interfaces/network_info_service_interface.dart';

class ConnectivityNetworkInfoService implements INetworkInfoService {
  final Connectivity _connectionChecker;

  ConnectivityNetworkInfoService(this._connectionChecker);

  @override
  Future<bool> get isConnected async {
    final connection = await _connectionChecker.checkConnectivity();
    if (connection == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
