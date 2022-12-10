import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';

class HomeViewModel{
  final String vodafoneCashServiceBackground='assets/images/backgrounds/vodafone_cash_payment_background.jpg';
  final String rechargeBtn='Recharge';
  final String migrateBtn='Migrate';
  final String rechargeNowTitle='Recharge now';
  final String exclusiveTitle='Exclusive For You';
  final String blackFridayTitle='Catch our Black Friday Deals';
  final String eshopDealsTitle='Eshop Deals';
  final String vodafoneCashServicesTitle='Pay by Vodafone Cash';
  final String donotMissTitle='Don\'t Miss';
  final String vodafonePlayTitle='Vodafone Play';
  final String entertainmentTitle='Entertainment for you';
  final String onClickServiceTitle='Your Services in one click';
  final String rechargeNowSubTitle='You\'re running out of balance, recharge now with no hassle';
  final String minutesInfoSuffix='used for the last 30 days';
  final String lastUpdatedTime='00:00 AM';
  final String lastUpdatedPrefix='Last updated';
  final String balanceTitle='Balance';
  final String freeWatchTitle='Free WATCH IT,SHAHID VIP Mobile &${AppConstants.NEW_LINE}Anghami Plus';
  final String freeWatchSubTitle='Change to new Flex now';
  final String rewardFreeBanner='assets/images/banners/vodafone_rewards.jpg';

  String formatMinutes(int minutes){
    return '$minutes mins';
  }
}