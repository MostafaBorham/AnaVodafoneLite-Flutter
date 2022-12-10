import 'dart:async';

import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class InternetOfferView extends StatefulWidget {
  const InternetOfferView({Key? key}) : super(key: key);

  @override
  State<InternetOfferView> createState() => _InternetOfferViewState();
}

class _InternetOfferViewState extends State<InternetOfferView> {
  final List<String> _gifts=[
    'Free extra Mbs',
    '20G extra quota',
    '25LE bundle for 13LE',
    'Free extra 40G',
    '100 Mbs for 1EGP',
    '20% off bundle',
    '20G extra quota',
    '40 EGP bundle discount'
  ];
  late Size _viewSize;
  bool _isRotating=false;
  final StreamController<int> _wheelController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    _wheelController.close();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        centerTitle: true,
        title: Text(
          'Mobile internet offers',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        elevation: 0,
      );

  Widget _buildBody() {
    bool isRed=true;
    return Stack(
    alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            'assets/images/backgrounds/wheel_spin_background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('Hit spin to start',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(
                    height: _viewSize.height * 0.1,
                  ),
                  Container(
                    height: _viewSize.width*0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.amberAccent,width: 15),
                      shape: BoxShape.circle
                    ),
                    child: FortuneWheel(
                      animateFirst: false,
                      alignment: Alignment.center,
                      onAnimationStart: (){
                        setState(() {
                          _isRotating=true;
                        });
                      },
                      onAnimationEnd: (){
                        setState(() {
                          _isRotating=false;
                        });
                      },
                      selected: _wheelController.stream,
                      indicators: [
                        FortuneIndicator(child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber.shade400,
                            border: Border.all(color: Colors.amber.shade800,width: 5,),
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.star,color: Colors.amber.shade100,)
                      )),
                        FortuneIndicator(child: TriangleIndicator(
                          color: Colors.redAccent.withOpacity(0.8),
                        ),alignment: Alignment.topCenter)
                      ],
                      items: _gifts.map((giftName) {
                        isRed=!isRed;
                        return FortuneItem(
                          child: Text(giftName,textAlign: TextAlign.center,softWrap: true,maxLines: 3,overflow: TextOverflow.ellipsis,),
                        style: FortuneItemStyle(
                          color: isRed?Colors.red:Colors.white,
                          textAlign: TextAlign.center,
                          textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: isRed?Colors.white:Colors.red,
                          )
                        )
                      );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: _viewSize.height * 0.05,
                  ),
                  Text('No Credit, No Problem!',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),),
                  Text('Redeem your offer and enjoy it with your next recharge',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: _viewSize.height * 0.02,
                  ),
                  CustomFullButton(
                      width: double.infinity,
                      verticalPadding: 12,
                      borderRadius: 10,
                      textStyle: Theme.of(context).textTheme.labelLarge!,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      text: 'Spin',
                      onPressed: _isRotating? null : (){
                        setState(() {
                          _wheelController.add(Fortune.randomInt(0, _gifts.length));
                        });
                      },
                      borderColor: Colors.transparent,
                      elevation: 5),
                  SizedBox(height: 5,),
                  CustomFullButton(
                      width: double.infinity,
                      verticalPadding: 12,
                      borderRadius: 10,
                      textStyle: Theme.of(context).textTheme.labelLarge!,
                      fontWeight: FontWeight.w400,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      text: 'Current offers',
                      elevation: 0,
                    onPressed: (){},
                    borderColor: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }
}
