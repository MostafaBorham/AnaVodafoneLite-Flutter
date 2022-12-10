import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:flutter/material.dart';

class ThreeSixFiveOffersView extends StatefulWidget {
  const ThreeSixFiveOffersView({Key? key}) : super(key: key);

  @override
  State<ThreeSixFiveOffersView> createState() => _ThreeSixFiveOffersViewState();
}

class _ThreeSixFiveOffersViewState extends State<ThreeSixFiveOffersView> {
  late Size _viewSize;
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _build365Body(),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        centerTitle: true,
        title: Text('365 Offers',style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w400
        ),),
    elevation: 0,
      );

  Widget _build365Body() => Stack(
    alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/backgrounds/mared_background.jpg',
            fit: BoxFit.cover,
            width: _viewSize.width,
            height: _viewSize.height,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _viewSize.width*0.06,vertical: _viewSize.height*0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: '365',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.red,
                    ),
                    children: [
                      TextSpan(
                        text: AppConstants.SPACE
                      ),
                      TextSpan(text: 'Offers',style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),)],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Wrap(
                  runSpacing: 3,
                  spacing: 20,
                  alignment: WrapAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      width: _viewSize.width*.25,
                      height: _viewSize.width*.33,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(false? 'assets/images/icons/closed_gift.png' : 'assets/images/icons/opened_gift.png',height: _viewSize.width*0.1,width: _viewSize.width*0.1,fit: BoxFit.contain,),
                          SizedBox(height: 10,),
                          if(true) Text('20 Mins',maxLines: 2,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomFullButton(
                    width: double.infinity,
                    verticalPadding: 12,
                    borderRadius: 0,
                    textStyle: Theme.of(context).textTheme.titleLarge!,
                    fontWeight: FontWeight.w400,
                    backgroundColor: Colors.red.withOpacity(0.7),
                    foregroundColor: Colors.white,
                    text: 'Play Again',
                    borderColor: Colors.transparent,
                    onPressed: (){},
                    elevation: 0),
                SizedBox(height: 10,),
                CustomFullButton(
                    width: double.infinity,
                    verticalPadding: 12,
                    borderRadius: 0,
                    textStyle: Theme.of(context).textTheme.titleLarge!,
                    fontWeight: FontWeight.w400,
                    backgroundColor: Colors.red.withOpacity(0.7),
                    foregroundColor: Colors.white,
                    text: 'Customize My Offer',
                    borderColor: Colors.transparent,
                    onPressed: (){},
                    elevation: 0),
                SizedBox(height: 15,),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(onPressed: (){}, child: Text('View offers\' consumption',style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline
                  )),style: Theme.of(context).textButtonTheme.style,),
                )
              ],
            ),
          )
        ],
      );
}
