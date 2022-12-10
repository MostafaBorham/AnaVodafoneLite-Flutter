import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:ana_vodafone_lite/shared/widgets/empty_widget.dart';
import 'package:ana_vodafone_lite/view_models/home/home_view_model.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final int _bottomNavIndex = 0;
  late Size _viewSize;
  final HomeViewModel _homeViewModel = HomeViewModel();
  final List<String> mediaLogos = [
    'assets/images/logos/shahid_logo.png',
    'assets/images/logos/watch_it_logo.png',
    'assets/images/logos/anghami_logo.png',
  ];
  final List<ServiceContentModel> serviceModels = [
    ServiceContentModel(
        title: 'Internet',
        icon: Icons.mobiledata_off,
        btnName: 'Subscribe',
        description: 'You are not subscribed to any bundle.'),
    ServiceContentModel(
      title: 'Minutes',
    ),
    ServiceContentModel(
        title: 'Fakka Cards',
        icon: Icons.currency_exchange,
        btnName: 'Manage',
        description: 'You don\'t have any cards, recharge Fakka cards now.'),
    ServiceContentModel(
        title: 'DSL',
        icon: Icons.router_sharp,
        btnName: 'Subscribe',
        description: 'You are currently not subscribed to any bundle.'),
    ServiceContentModel(
        title: 'Roaming',
        icon: Icons.airplanemode_active_outlined,
        btnName: 'Explore',
        description: 'You are not subscribed to any bundle.'),
  ];
  final List<VodafoneService> vodafoneCashPaymentServices = [
    VodafoneService(
        name: 'Balance Recharge',
        image: 'assets/images/icons/balance_recharge_icon.png'),
    VodafoneService(
        name: 'Universities and Schools Tuitions',
        image: 'assets/images/icons/university_icon.png'),
    VodafoneService(
        name: 'valU Installments', image: 'assets/images/logos/valu_logo.png'),
    VodafoneService(
        name: 'B.TECH Installments',
        image: 'assets/images/logos/btech_logo.png'),
    VodafoneService(
        name: 'Vodafone Play',
        image: 'assets/images/logos/vodafone_play_logo.jpg'),
    VodafoneService(
        name: 'Money Transfer',
        image: 'assets/images/icons/money_transfer_icon.png'),
    VodafoneService(
        name: 'Online Payment Card',
        image: 'assets/images/icons/payment_card_icon.png'),
    VodafoneService(
        name: 'Bill Payments',
        image: 'assets/images/icons/bills_payment_icon.png'),
  ];
  final List<VodafoneService> oneClickServices = [
    VodafoneService(
        name: 'Vodafone DSL', image: 'assets/images/icons/dsl_icon.png'),
    VodafoneService(
        name: 'Vodafone Cash',
        image: 'assets/images/logos/vodafone_cash_logo.png'),
    VodafoneService(
        name: 'Pay bill for others',
        image: 'assets/images/icons/bill_icon.png'),
    VodafoneService(
        name: 'Recharge for others',
        image: 'assets/images/icons/recharge_icon.png'),
    VodafoneService(
        name: 'Balance Transfer',
        image: 'assets/images/icons/balance_transfer_icon.png'),
    VodafoneService(name: 'USB', image: 'assets/images/icons/usb_icon.png'),
  ];
  final List<IconData> bottomNavIcons = [
    Icons.home_filled,
    Icons.local_fire_department_outlined,
    Icons.forward_to_inbox_sharp,
    Icons.view_headline_sharp
  ];
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade200,
      body: _buildHomeBody(), //destination screen
      floatingActionButton: SizedBox(
        height: _viewSize.width * 0.2,
        width: _viewSize.width * 0.2,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          elevation: 10,
          child: Icon(
            Icons.person_outline,
            color: Colors.black54,
            size: _viewSize.width * 0.12,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomNavIcons,
        activeColor: Colors.red,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        backgroundColor: Colors.white,
        elevation: 50,
        shadow: const Shadow(
          color: Colors.grey,
          blurRadius: 5,
        ),
        height: _viewSize.height * 0.085,
        onTap: (index) {},
        //other params
      ),
    );
  }

  Widget _buildHomeBody() => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppConstants.VODAFONE_LOGO,
                        fit: BoxFit.contain,
                        width: _viewSize.width * 0.11,
                        height: _viewSize.width * 0.11,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: _viewSize.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _buildVodafoneBanners(),
                      itemCount: 3),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: _viewSize.height * 0.23,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          clipBehavior: Clip.hardEdge,
                          child: _buildServicesTabHost(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [_buildOfferCustomizeUi(), _buildBalanceUi()],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildBundleMigrateUi(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildExclusiveForYouUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildBlackFridayUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildEshopUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildVodafoneCashServicesUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildDonotMissUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildVodafonePlayUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildEntertainmentUi(),
                const SizedBox(
                  height: 15,
                ),
                _buildOneClickServicesUi(),
              ],
            ),
          ),
        ),
      );

  Widget _buildVodafoneBanners({String? image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.9,
        height: _viewSize.height * 0.19,
        child: image != null
            ? Image.network(
                image,
                fit: BoxFit.cover,
              )
            : _buildRechargeNowBanner(),
      );
  Widget _buildExclusivePoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.4,
        height: _viewSize.width * 0.4,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildEshopPoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.4,
        height: _viewSize.width * 0.4,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildDonotMissPoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.4,
        height: _viewSize.width * 0.4,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildVodafonePlayPoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.4,
        height: _viewSize.width * 0.4,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildVodafoneCashServicePoster(
          {required VodafoneService vcService}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.4,
        height: _viewSize.width * 0.4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  _homeViewModel.vodafoneCashServiceBackground,
                ),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vcService.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w400),
              ),
              Image.asset(
                vcService.image,
                fit: BoxFit.contain,
                width: _viewSize.width * 0.2,
                height: _viewSize.width * 0.2,
              ),
            ],
          ),
        ),
      );
  Widget _buildBlackFridayPoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.9,
        height: _viewSize.height * 0.25,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildRechargeNowBanner() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  _homeViewModel.rechargeNowTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600, height: 1.5),
                ),
                subtitle: Text(
                  _homeViewModel.rechargeNowSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                ),
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: CustomFullButton(
                  width: _viewSize.width * 0.22,
                  onPressed: () {},
                  verticalPadding: 0,
                  borderRadius: 10,
                  textStyle: Theme.of(context).textTheme.labelLarge!,
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  text: _homeViewModel.rechargeBtn,
                  elevation: 0),
            )
          ],
        ),
      );
  Widget _buildServicesTabHost() => DefaultTabController(
      length: serviceModels.length,
      child: Column(
        children: [
          TabBar(
            tabs: serviceModels
                .map((serviceModel) => Tab(
                      text: serviceModel.title,
                    ))
                .toList(),
            indicatorColor: Colors.red,
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w400),
            labelStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: TabBarView(
                  children: serviceModels
                      .map((serviceModel) => serviceModel.description != null
                          ? _buildServiceTabBarView(serviceModel: serviceModel)
                          : _buildMinutesServiceTabBarView())
                      .toList()),
            ),
          )
        ],
      ));
  Widget _buildServiceTabBarView({required ServiceContentModel serviceModel}) =>
      Column(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(serviceModel.icon),
              title: Text(serviceModel.description!),
              contentPadding: EdgeInsets.zero,
              minLeadingWidth: 0,
              dense: true,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: CustomFullButton(
                width: _viewSize.width * 0.22,
                onPressed: () {},
                verticalPadding: 0,
                borderRadius: 10,
                textStyle: Theme.of(context).textTheme.labelLarge!,
                fontWeight: FontWeight.w400,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                text: serviceModel.btnName!,
                elevation: 0),
          )
        ],
      );
  Widget _buildMinutesServiceTabBarView() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          FutureBuilder<int>(
            future: Future.delayed(Duration.zero, () => 10),
            builder: (context, minutes) => minutes.hasData
                ? Text.rich(TextSpan(
                    text: _homeViewModel.formatMinutes(minutes.data!),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    children: [
                        TextSpan(
                          text: _homeViewModel.minutesInfoSuffix,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                        )
                      ]))
                : const EmptyWidget(),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 3,
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.refresh),
              Text(_homeViewModel.lastUpdatedPrefix +
                  AppConstants.SPACE +
                  _homeViewModel.lastUpdatedTime)
            ],
          )
        ],
      );

  Widget _buildOfferCustomizeUi() => _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.42,
        height: _viewSize.height * 0.15,
        child: Image.asset(
          _homeViewModel.rewardFreeBanner,
          fit: BoxFit.cover,
        ),
      );
  Widget _buildBalanceUi() => _buildCustomCircularCardPoster(
        width: _viewSize.width * 0.42,
        height: _viewSize.height * 0.15,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: FutureBuilder<double>(
            future: Future.delayed(Duration.zero, () => 0.25),
            builder: (context, balance) => balance.hasData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.newspaper),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(_homeViewModel.balanceTitle)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${0.25} EGP',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Text('Recharge'),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red),
                            padding: MaterialStateProperty.resolveWith(
                                (states) => EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.center,
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(50, 30)),
                            overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          label: const Icon(Icons.keyboard_arrow_right))
                    ],
                  )
                : const EmptyWidget(),
          ),
        ),
      );

  Widget _buildBundleMigrateUi() => _buildCustomCircularCardPoster(
        width: double.infinity,
        height: _viewSize.height * 0.16,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _homeViewModel.freeWatchTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    _homeViewModel.freeWatchSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: mediaLogos
                        .map((logo) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.asset(
                                logo,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  CustomFullButton(
                      width: _viewSize.width * 0.19,
                      verticalPadding: 5,
                      borderRadius: 10,
                      textStyle: Theme.of(context).textTheme.labelLarge!,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.red,
                      text: _homeViewModel.migrateBtn,
                      onPressed: () {},
                      borderColor: Colors.red,
                      elevation: 0)
                ],
              )
            ],
          ),
        ),
      );

  Widget _buildExclusiveForYouUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.exclusiveTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.width * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildExclusivePoster(
                    image:
                        'https://1.bp.blogspot.com/-Hj7dfowk8wM/XyEYF2lZZTI/AAAAAAAAC4M/l_TWRbRflrULi2Q16dgaER2j23YayA5nwCLcBGAsYHQ/s1600/blogger-2020-Vodafone-Cash-article.png'),
                itemCount: 3),
          ),
        ],
      );

  Widget _buildBlackFridayUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.blackFridayTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.height * 0.25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildBlackFridayPoster(
                    image:
                        'https://eshop.vodafone.com.eg/eshopContent//product_images/original/VF-50-Black-Friday-deals-1366-380-desk.jpg'),
                itemCount: 3),
          ),
        ],
      );

  Widget _buildEshopUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.eshopDealsTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.width * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildEshopPoster(
                    image:
                        'https://1.bp.blogspot.com/-Hj7dfowk8wM/XyEYF2lZZTI/AAAAAAAAC4M/l_TWRbRflrULi2Q16dgaER2j23YayA5nwCLcBGAsYHQ/s1600/blogger-2020-Vodafone-Cash-article.png'),
                itemCount: 3),
          ),
        ],
      );

  Widget _buildVodafoneCashServicesUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.vodafoneCashServicesTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.width * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _buildVodafoneCashServicePoster(
                        vcService: vodafoneCashPaymentServices[index]),
                itemCount: vodafoneCashPaymentServices.length),
          ),
        ],
      );

  Widget _buildDonotMissUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.donotMissTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.width * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildDonotMissPoster(
                    image:
                        'https://1.bp.blogspot.com/-Hj7dfowk8wM/XyEYF2lZZTI/AAAAAAAAC4M/l_TWRbRflrULi2Q16dgaER2j23YayA5nwCLcBGAsYHQ/s1600/blogger-2020-Vodafone-Cash-article.png'),
                itemCount: 3),
          ),
        ],
      );

  Widget _buildVodafonePlayUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.vodafonePlayTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.width * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _buildVodafonePlayPoster(
                    image:
                        'https://1.bp.blogspot.com/-Hj7dfowk8wM/XyEYF2lZZTI/AAAAAAAAC4M/l_TWRbRflrULi2Q16dgaER2j23YayA5nwCLcBGAsYHQ/s1600/blogger-2020-Vodafone-Cash-article.png'),
                itemCount: 3),
          ),
        ],
      );

  Widget _buildEntertainmentUi() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _homeViewModel.entertainmentTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildEntertainmentPoster(
                image: 'assets/images/banners/entertainment.png')
          ],
        ),
      );

  Widget _buildEntertainmentPoster({required String image}) =>
      _buildCustomCircularCardPoster(
        width: double.infinity,
        height: _viewSize.height * 0.4,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildOneClickServicesUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              _homeViewModel.onClickServiceTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: _viewSize.height * 0.2,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _buildServiceUi(service: oneClickServices[index]),
                itemCount: oneClickServices.length),
          ),
        ],
      );

  Widget _buildServiceUi({required VodafoneService service}) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: _viewSize.width * 0.2,
        height: _viewSize.height * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(18),
                  elevation: 10),
              child: CircleAvatar(
                backgroundColor: Colors.cyan.shade500,
                radius: _viewSize.width * 0.05,
                child: Image.asset(
                  service.image,
                  fit: BoxFit.contain,
                  height: _viewSize.width * 0.07,
                  width: _viewSize.width * 0.07,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              service.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  Widget _buildCustomCircularCardPoster(
          {required double width,
          required double height,
          required Widget child}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: height,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          child: child,
        ),
      );
}

class ServiceContentModel {
  final String title;
  final String? description;
  final String? btnName;
  final IconData? icon;

  ServiceContentModel(
      {required this.title, this.description, this.btnName, this.icon});
}

class VodafoneService {
  final String name;
  final String image;

  VodafoneService({required this.name, required this.image});
}
