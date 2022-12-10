import 'package:ana_vodafone_lite/data/models/store_branches/store_model.dart';
import 'package:ana_vodafone_lite/data/repositories/store_branches/store_branches_repository.dart';

class StoreLocatorViewModel{
  double gLatitude=0;
  double gLongitude=0;
  bool isExpanded=false;
  String? governmentValue;
  String? cityValue;
  String? storeTypeValue;
  final List<String> storeTypes=[
    'Select store type',
    'Vodafone Stores'
  ];
  StoreBranchesRepository storeBranchesRepository;

  StoreLocatorViewModel({required this.storeBranchesRepository}){
    storeTypeValue=storeTypes.first;
  }

  Future<List<String>> getAllGovernments() async {
    List<String> governments=List<String>.empty();
    governments=await storeBranchesRepository.fetchAllGovernments();
    governmentValue ??= governments.first;
    return governments;
  }
  Future<List<String>> getAllCities(String government) async {
    List<String> cities=List<String>.empty();
    cities=await storeBranchesRepository.fetchAllCities(government);
    cityValue ??= cities.first;
    return cities;
  }
  Future<List<StoreModel>> getNearestStores(String government,String city) async {
    List<StoreModel> stores=List<StoreModel>.empty();
    stores=await storeBranchesRepository.fetchNearestStores(government,city);
    return stores;
  }
}