import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnectivity{
  late Connectivity _connectivity;

  AppConnectivity(){
    _connectivity=Connectivity();
  }
  Future<ConnectivityResult> checkConnectivity()async{
    final connectivityResult=await _connectivity.checkConnectivity();
    return connectivityResult;
  }

  Connectivity get connectivity => _connectivity;
}