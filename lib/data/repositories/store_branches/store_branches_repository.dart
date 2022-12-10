import 'package:ana_vodafone_lite/data/models/store_branches/store_model.dart';

abstract class StoreBranchesRepository{
  Future<List<String>> fetchAllGovernments();
  Future<List<String>> fetchAllCities(String government);
  Future<List<StoreModel>> fetchNearestStores(String government,String city);
}