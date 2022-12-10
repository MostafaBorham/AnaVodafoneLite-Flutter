class StoreModel{
  String name;
  String address;
  String workingHours;
  bool isOpened;
  String directions;
  double latitude;
  double longitude;

  StoreModel(
  {required this.name, required this.address, required this.workingHours, required this.isOpened, required this.directions, required this.latitude,required this.longitude,});
}