import 'package:ana_vodafone_lite/data/models/store_branches/store_model.dart';
import 'package:ana_vodafone_lite/data/repositories/store_branches/data_sources/fake_store_branches_repository.dart';
import 'package:ana_vodafone_lite/shared/connectivity/app_location.dart';
import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_drop_down_button.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_text_form_field.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/departments/store_locator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocatorView extends StatefulWidget {
  const StoreLocatorView({Key? key}) : super(key: key);

  @override
  State<StoreLocatorView> createState() => _StoreLocatorViewState();
}

class _StoreLocatorViewState extends State<StoreLocatorView> {
  late Size _viewSize;
  final TextEditingController _storeController = TextEditingController();
  final StoreLocatorViewModel _storeLocatorViewModel = StoreLocatorViewModel(
      storeBranchesRepository: FakeStoreBranchesRepository());
  final AppLocation _appLocation = AppLocation();
  Set<Marker> markers = {};
  bool a = true;

  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Store Locator',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: FutureBuilder<bool>(
          future: _appLocation.isLocationEnabled(),
          builder: (context, snapshot) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                snapshot.hasData
                    ? (snapshot.data!
                        ? _buildGoogleMapUi()
                        : _buildEnableLocationRequestUi())
                    : _buildLoadingUi(),
                _buildLocationFilterUi()
              ],
            );
          }),
    );
  }

  Widget _buildGoogleMapUi() {
    return FutureBuilder<Position>(
        future: _appLocation.getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            configMap(snapshot.data);
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(_storeLocatorViewModel.gLatitude,
                      _storeLocatorViewModel.gLongitude),
                  zoom: 15),
              mapType: MapType.hybrid,
              markers: markers,
            );
          } else {
            return _buildLoadingUi();
          }
        });
  }

  Widget _buildEnableLocationRequestUi() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.add_location_outlined,
                  color: Colors.red,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Check the nearest stores to your location',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Enabling location services allows us to provide you with the best experience',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    _appLocation.enableLocation().then((_) {
                      setState(() {});
                    }).catchError((error) {
                      showSnackbar(error.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(5)),
                  child: const Text('Enable Location Services')),
            )
          ],
        ),
      );
  Widget _buildLocationFilterUi() => Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 15),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: _viewSize.height * 0.05,
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Center(
                              child: CustomTextFormField(
                                  controller: _storeController,
                                  hintText: 'Find a store',
                                  obscureText: false,
                                  keyboardType: TextInputType.text),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    foregroundColor: Colors.black26,
                                    padding: EdgeInsets.zero,
                                    elevation: 5,
                                    side: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Icon(Icons.search)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black38,
                    height: _viewSize.height * 0.05,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FutureBuilder<List<String>>(
                            future: _storeLocatorViewModel.getAllGovernments(),
                            builder: (context, snapshot) {
                              return CustomDropDownButton(
                                  defaultValue:
                                      _storeLocatorViewModel.governmentValue,
                                  onChanged: (newGovernment) {
                                    _storeLocatorViewModel.governmentValue =
                                        newGovernment;
                                    setState(() {});
                                  },
                                  items: snapshot.hasData
                                      ? snapshot.data!
                                      : List<String>.empty());
                            }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FutureBuilder<List<String>>(
                            future: _storeLocatorViewModel.getAllCities(
                                _storeLocatorViewModel.governmentValue ??
                                    AppConstants.STR_EMPTY),
                            builder: (context, snapshot) {
                              return CustomDropDownButton(
                                  defaultValue:
                                      _storeLocatorViewModel.cityValue,
                                  onChanged: (newCity) {
                                    _storeLocatorViewModel.cityValue = newCity;
                                    setState(() {});
                                  },
                                  items: snapshot.hasData
                                      ? snapshot.data!
                                      : List<String>.empty());
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: CustomDropDownButton(
                        defaultValue: _storeLocatorViewModel.storeTypeValue,
                        items: _storeLocatorViewModel.storeTypes,
                        onChanged: (newStoreType) {
                          _storeLocatorViewModel.storeTypeValue = newStoreType;
                          setState(() {});
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            FutureBuilder<List<StoreModel>>(
                future: _storeLocatorViewModel.getNearestStores(
                    _storeLocatorViewModel.governmentValue ??
                        AppConstants.STR_EMPTY,
                    _storeLocatorViewModel.cityValue ?? AppConstants.STR_EMPTY),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        child: ListTile(
                          title: Text(
                              'You have ${snapshot.data?.length ?? 0} Stores in this area'),
                          trailing: _storeLocatorViewModel.isExpanded
                              ? Icon(Icons.keyboard_arrow_up)
                              : Icon(Icons.keyboard_arrow_down_sharp),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          minVerticalPadding: 0,
                          onTap: () {
                            _storeLocatorViewModel.isExpanded =
                                !_storeLocatorViewModel.isExpanded;
                            setState(() {});
                          },
                        ),
                      ),
                      if (_storeLocatorViewModel.isExpanded)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: _viewSize.height * 0.25,
                          child: ListView.separated(
                              itemBuilder: (context, index) => _buildStoreItem(
                                  snapshot.hasData
                                      ? snapshot.data!.elementAt(index)
                                      : List<StoreModel>.empty()
                                          .elementAt(index)),
                              separatorBuilder: (context, index) => Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                              itemCount:
                                  snapshot.hasData ? snapshot.data!.length : 0),
                        ),
                    ],
                  );
                })
          ],
        ),
      );
  Widget _buildLoadingUi() => const Center(
          child: CircularProgressIndicator(
        color: Colors.red,
      ));
  configMap(position) {
    _storeLocatorViewModel.gLatitude = position.latitude;
    _storeLocatorViewModel.gLongitude = position.longitude;
    markers.add(Marker(
        markerId: MarkerId('marker 1'),
        position: LatLng(position.latitude, position.longitude)));
  }

  void showSnackbar(String content) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(content)));
  }

  Widget _buildStoreItem(StoreModel store) => ListTile(
        title: Text(store.name),
        subtitle: Text(store.address),
        dense: true,
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.red,
        ),
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              isDismissible: true,
              builder: (context) => _buildStoreDetailsUi(store));
        },
      );

  Widget _buildStoreDetailsUi(StoreModel store) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logos/vodafone_store.jpg',
              fit: BoxFit.contain,
              alignment: Alignment.center,
              width: _viewSize.width * 0.23,
              height: _viewSize.width * 0.23,
            ),
            SizedBox(
              height: _viewSize.height * 0.05,
            ),
            Text(
              store.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: _viewSize.height * 0.02,
            ),
            Text(
              store.address,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: _viewSize.height * 0.02,
            ),
            Text(
              store.workingHours,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: _viewSize.height * 0.01,
            ),
            Text(
              store.isOpened ? 'Open' : 'Closed',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400, color: Colors.redAccent),
            ),
            SizedBox(
              height: _viewSize.height * 0.02,
            ),
            CustomFullButton(
                width: double.infinity,
                onPressed: () {},
                elevation: 0,
                verticalPadding: 15,
                borderRadius: 8,
                textStyle: Theme.of(context).textTheme.labelLarge!,
                fontWeight: FontWeight.w300,
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                text: 'Get directions'),
            SizedBox(
              height: _viewSize.height * 0.02,
            ),
            CustomFullButton(
                width: double.infinity,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 0,
                verticalPadding: 15,
                borderRadius: 8,
                textStyle: Theme.of(context).textTheme.labelLarge!,
                fontWeight: FontWeight.w300,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                text: 'Cancel'),
          ],
        ),
      );
}
