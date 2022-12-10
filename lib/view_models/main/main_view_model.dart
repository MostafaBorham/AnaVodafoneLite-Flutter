import 'package:flutter/material.dart';

class MainViewModel{
  final int navigationBarCurrentIndex=1;
  final String viewTitle='Stay Connected';
  final String viewSubtitle1='Keep tabs on your usage, subscriptions payments and rewards. All in one app. ';
  final String viewSubtitle2='Ana Vodafone won\'t consume from your data bundle.';
  final String langBtn='العربية';
  final String mobileHint='Enter mobile number';
  final String passwordHint='Enter Password';
  final String forgotBtn='Forgot?';
  final String loginBtn='Login';
  final String haveAccountMessage='Don\'t have an account?';
  final String registerBtn='Register';
  final String backToAccsBtn='Back to my accounts';
  final String mobileRegisterMessageTitle='Don\'t want to register an account?';
  final String mobileRegisterMessageSubtitle='Turn off Wifi and Turn on your mobile data';
  final String continueAsTxt='Continue as';
  final String simTxt='SIM';
  final String moreAccountMsgTitle='You can manage up to 5 accounts';
  final String moreAccountMsgSubtitle='plus your sim card';
  final String newAccountBtn='Add new account >';
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Shop with us'),
    BottomNavigationBarItem(
        icon: Icon(Icons.phonelink_sharp), label: 'Get Started'),
    BottomNavigationBarItem(
        icon: Icon(Icons.storefront_sharp), label: 'Nearest Branch'),
    BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined), label: 'Explore'),
  ];

  const MainViewModel();
}