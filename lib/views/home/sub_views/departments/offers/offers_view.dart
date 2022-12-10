import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:ana_vodafone_lite/view_models/home/sub_view_models/departments/offers/offers_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class OffersView extends StatefulWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  late Size _viewSize;
  final OffersViewModel _offersViewModel = OffersViewModel();

  final List<Offer> _offers = [
    Offer(
        title: '365 Offers',
        subTitle: 'sefsdfsdfsdfdf sdfdsfsdsdfsd',
        image:
            'https://web.vodafone.com.eg/documents/31803/0/MultiSim_WhatCanTheyDo_InnerBanner+640.jpg/45d7b72b-11ee-8294-7a91-c0757e6cc577?t=1495536194734'),
    Offer(
        title: 'Internet offer',
        subTitle: 'sefsdfsdfsdfdf sdfdsfsdsdfsd',
        image:
            'https://web.vodafone.com.eg/documents/31803/0/MultiSim_WhatCanTheyDo_InnerBanner+640.jpg/45d7b72b-11ee-8294-7a91-c0757e6cc577?t=1495536194734'),
    Offer(
        title: 'Customize My Offer',
        subTitle: 'sefsdfsdfsdfdf sdfdsfsdsdfsd',
        image:
            'https://web.vodafone.com.eg/documents/31803/0/MultiSim_WhatCanTheyDo_InnerBanner+640.jpg/45d7b72b-11ee-8294-7a91-c0757e6cc577?t=1495536194734'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.loaderOverlay.show();
    Future.delayed(Duration(seconds: 5),() {
      context.loaderOverlay.hide();
    },);
  }
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text(
          'Offers for you',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            Icons.history,
            color: Colors.black54,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ))
        ],
      );

  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [_buildOffersUi(), _buildScratchCouponPageButton()],
        ),
      );

  Widget _buildOffersUi() => Expanded(
        flex: 9,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildScratchCouponUi(),
                  SizedBox(
                    height: _viewSize.height * 0.07,
                  ),
                  Text(
                    'made for you',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: _viewSize.height * 0.03,
                  ),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              delegate: SliverChildBuilderDelegate((context, index) => _buildOfferItem(offer: _offers[index]),childCount: _offers.length,),
            )
          ],
        ),
      );

  Widget _buildScratchCouponUi() => Container(
        width: double.infinity,
        height: _viewSize.height * 0.25,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/backgrounds/scratch_coupon_background.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Redeem & Win a Free Scratch Coupon',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.red, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Redeem any offer and win a scratch Coupon with a free gift',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You have - unopened Coupons',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ), //need data
            SizedBox(
              height: 10,
            ),
            Text(
              _offersViewModel.lastUpdatedPrefix +
                  AppConstants.SPACE +
                  _offersViewModel.lastUpdatedTime,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.black54, fontWeight: FontWeight.w400),
            ), //need data
            CustomFullButton(
              width: double.infinity,
              verticalPadding: 5,
              borderRadius: 7,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              text: 'Tap here to refresh',
              elevation: 0,
              borderColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ),
      );


  Widget _buildOfferItem({required Offer offer}) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Image.network(
                offer.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              offer.title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              offer.subTitle,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            CustomFullButton(
              width: double.infinity,
              verticalPadding: 5,
              borderRadius: 10,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              text: 'Play now',
              elevation: 2,
              borderColor: Colors.transparent,
              onPressed: () {},
            )
          ],
        ),
      );

  Widget _buildScratchCouponPageButton() => Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            leading: Icon(
              Icons.celebration,
              color: Colors.amberAccent,
              size: _viewSize.width * 0.1,
            ),
            title: Text(
              'My Scratch Coupons Page',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white54,
            ),
          ),
        ),
      );
}

class Offer {
  final String title;
  final String subTitle;
  final String image;

  Offer({required this.title, required this.subTitle, required this.image});
}
