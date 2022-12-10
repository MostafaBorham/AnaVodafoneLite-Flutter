import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({Key? key, required this.pageName}) : super(key: key);
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.grey,
      seconds: 4,
      navigateAfterSeconds: pageName,
      image: Image(image: AssetImage('assets/images/splash/vodafone_loading.gif'),alignment: AlignmentDirectional.center,),
      useLoader: false,

    );
  }
}
