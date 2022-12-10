import 'package:ana_vodafone_lite/data/models/store_branches/store_model.dart';
import 'package:ana_vodafone_lite/data/repositories/store_branches/store_branches_repository.dart';

class LocalStoreBranchesRepository implements StoreBranchesRepository{
  @override
  Future<List<String>> fetchAllGovernments() {
    // TODO: implement getAllGovernments
    throw UnimplementedError();
  }

  @override
  Future<List<String>> fetchAllCities(String government) {
    // TODO: implement fetchAllCities
    throw UnimplementedError();
  }

  @override
  Future<List<StoreModel>> fetchNearestStores(String government, String city) {
    // TODO: implement fetchNearestStores
    throw UnimplementedError();
  }
}