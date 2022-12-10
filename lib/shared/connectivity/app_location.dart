import 'package:geolocator/geolocator.dart';

class AppLocation{
  Future<bool> isLocationEnabled() async{
    return await Geolocator.isLocationServiceEnabled() && await _isPermissionsAllowed();
  }

  Future<void> enableLocation() async{
    if(!await _isPermissionsAllowed()){
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
      else if (permission==LocationPermission.deniedForever) {
        return Future.error('Location permissions are denied forever\nYou can change that from app settings \u{2699}');
      }
    }

      await Geolocator.getCurrentPosition();
  }

  Future<Position> getCurrentLocation()async=>await Geolocator.getCurrentPosition();

  Future<bool> _isPermissionsAllowed()async{
    final currentPermission=await Geolocator.checkPermission();
    return currentPermission==LocationPermission.always || currentPermission==LocationPermission.whileInUse;
  }
}