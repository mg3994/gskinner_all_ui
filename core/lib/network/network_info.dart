


import '../enums/auth_status.dart';
import 'network_connectivity_status.dart';

abstract interface class NetworkInfo {
  const NetworkInfo();
  Stream<(NetworkConnectivityStatus,AuthStatus)> get onStatusChange;
  Future<NetworkConnectivityStatus> get isConnected;
}

