import 'package:ana_vodafone_lite/shared/views/shop_explore_view.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/departments/shop_with_us_view_model.dart';
import 'package:flutter/material.dart';

class ShopWithUsView extends StatelessWidget {
  ShopWithUsView({Key? key}) : super(key: key);
  final ShopWithUsViewModel _shopWithUsViewModel=ShopWithUsViewModel();

  @override
  Widget build(BuildContext context) {
    return ShopExploreView(viewTitle: 'Shop', url: _shopWithUsViewModel.webUrl);
  }
}
