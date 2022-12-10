import 'package:ana_vodafone_lite/shared/route/app_routes.dart';
import 'package:ana_vodafone_lite/shared/views/auth_fail_view.dart';
import 'package:ana_vodafone_lite/shared/views/auth_success_view.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_overlay_loading.dart';
import 'package:ana_vodafone_lite/views/home/home_view.dart';
import 'package:ana_vodafone_lite/views/home/sub_views/departments/offers/offers_view.dart';
import 'package:ana_vodafone_lite/views/home/sub_views/departments/offers/sub_views/internet_offer/internet_offer_view.dart';
import 'package:ana_vodafone_lite/views/home/sub_views/departments/offers/sub_views/three_six_five_offers/three_six_five_offers_view.dart';
import 'package:ana_vodafone_lite/views/main/main_view.dart';
import 'package:ana_vodafone_lite/views/main/sub_views/auth_views/forgot_password_view.dart';
import 'package:ana_vodafone_lite/views/main/sub_views/auth_views/register_view.dart';
import 'package:ana_vodafone_lite/views/main/sub_views/departments/explore_view.dart';
import 'package:ana_vodafone_lite/views/main/sub_views/departments/shop_with_us_view.dart';
import 'package:ana_vodafone_lite/views/main/sub_views/departments/store_locator_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case AppRoutes.mainViewRoute:
      return MaterialPageRoute(builder: (_)=>const MainView());
    case AppRoutes.threeSixFiveOffersViewRoute:
      return MaterialPageRoute(builder: (_)=>const ThreeSixFiveOffersView());
    case AppRoutes.internetOfferViewRoute:
      return MaterialPageRoute(builder: (_)=>const InternetOfferView());
    case AppRoutes.offersViewRoute:
      return MaterialPageRoute(builder: (_)=>const CustomOverlayLoading(
          customChild: OffersView()));
    case AppRoutes.shopWithUsViewRoute:
      return MaterialPageRoute(builder: (_)=>ShopWithUsView());
    case AppRoutes.exploreViewRoute:
      return MaterialPageRoute(builder: (_)=>ExploreView());
    case AppRoutes.storeLocatorViewRoute:
      return MaterialPageRoute(builder: (_)=>const StoreLocatorView());
    case AppRoutes.registerViewRoute:
      return MaterialPageRoute(builder: (_)=>const RegisterView());
    case AppRoutes.forgotPasswordViewRoute:
      return MaterialPageRoute(builder: (_)=>const ForgotPasswordView());
    case AppRoutes.authSuccessViewRoute:
      return MaterialPageRoute(builder: (_)=>AuthSuccessView());
    case AppRoutes.authFailViewRoute:
      return MaterialPageRoute(builder: (_)=>AuthFailView());
    case AppRoutes.homeViewRoute:
      return MaterialPageRoute(builder: (_)=>const HomeView());
    default:
      return MaterialPageRoute(builder: (_)=>Container());
  }
}