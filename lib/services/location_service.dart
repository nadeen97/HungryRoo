import 'dart:html';

import 'package:location/location.dart';


class LocationService {
  Location location = new Location();
  bool isServiceEnabled;
  PermissionStatus permissionStatus;
  LocationData locationData;

  checkServiceEnabled() async
  {
    isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return;
      }
    }
  }

  checkPermissionStatus() async
  {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
  }
  
  LocationService()
  {
    checkServiceEnabled();
    checkPermissionStatus();
  }
}
