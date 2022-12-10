import 'package:ana_vodafone_lite/shared/views/shop_explore_view.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/departments/explore_view_model.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key}) : super(key: key);
  final ExploreViewModel _exploreViewModel=ExploreViewModel();

  @override
  Widget build(BuildContext context) {
    return ShopExploreView(viewTitle: 'Explore', url: _exploreViewModel.webUrl);
  }
}
