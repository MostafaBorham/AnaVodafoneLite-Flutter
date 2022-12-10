import 'package:ana_vodafone_lite/data/models/store_branches/store_model.dart';
import 'package:ana_vodafone_lite/data/repositories/store_branches/store_branches_repository.dart';

class FakeStoreBranchesRepository implements StoreBranchesRepository{
  @override
  Future<List<String>> fetchAllGovernments() async{
    return await Future.value([
      'Alexandria',
      'Aswan',
      'Asyut',
      'Beheira',
      'Beni Suef',
      'Cairo',
      'Dakahlia',
      'Damietta',
      'Faiyum',
      'Gharbia',
      'Giza',
      'Ismailia',
      'Kafr El Sheikh',
      'Luxor',
      'Matruh',
      'Minya',
      'Monufia',
      'New Valley',
      'North Sinai',
      'Port Said',
      'Qalyubia',
      'Qena',
      'Red Sea',
      'Sharqia',
      'Sohag',
      'South Sinai',
      'Suez',
    ]);
  }

  @override
  Future<List<String>> fetchAllCities(String government) async{
    return await Future.value(
      [
        'El Bagour',
        'Ashmoun',
        'El Shohada',
        'Birket el Sab',
        'Sadat City',
        'Menouf',
        'Quweisna',
        'Shibin el Kom',
        'Sers El Lyan',
        'Tala'
      ]
    );
  }

  @override
  Future<List<StoreModel>> fetchNearestStores(String government, String city) async{
    return await Future.value([
      StoreModel(name: 'xqdqqds', address: '2322vfdvdfvfdvd', workingHours: 'from 9 to 10', isOpened: true, directions: 'https://www.google.com.eg/maps/dir/30.5498481,31.1333353/Dexef+ERP+Solutions,+Ibrahim+Basha,+%D9%85%D8%B1%D9%83%D8%B2+%D9%82%D9%88%D9%8A%D8%B3%D9%86%D8%A7%E2%80%AD/@30.5478423,31.1423521,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14f7d9c735100749:0x8f72b635583fc39d!2m2!1d31.1420065!2d30.5459796?hl=ar&authuser=0', latitude: 30.549921183045576, longitude: 31.13336136202498),
      StoreModel(name: 'zrrrrqds', address: '1vftrtyryutfdvd', workingHours: 'from 1 to 2', isOpened: true, directions: 'https://www.google.com.eg/maps/dir/30.5498481,31.1333353/Dexef+ERP+Solutions,+Ibrahim+Basha,+%D9%85%D8%B1%D9%83%D8%B2+%D9%82%D9%88%D9%8A%D8%B3%D9%86%D8%A7%E2%80%AD/@30.5478423,31.1423521,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14f7d9c735100749:0x8f72b635583fc39d!2m2!1d31.1420065!2d30.5459796?hl=ar&authuser=0', latitude: 30.549921183045576, longitude: 31.13336136202498),
      StoreModel(name: 'arraanpps', address: '77vftrtyrfddfdvd', workingHours: 'from 3 to 5', isOpened: false, directions: 'https://www.google.com.eg/maps/dir/30.5498481,31.1333353/Dexef+ERP+Solutions,+Ibrahim+Basha,+%D9%85%D8%B1%D9%83%D8%B2+%D9%82%D9%88%D9%8A%D8%B3%D9%86%D8%A7%E2%80%AD/@30.5478423,31.1423521,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x14f7d9c735100749:0x8f72b635583fc39d!2m2!1d31.1420065!2d30.5459796?hl=ar&authuser=0', latitude: 30.549921183045576, longitude: 31.13336136202498),
    ]);
  }
}