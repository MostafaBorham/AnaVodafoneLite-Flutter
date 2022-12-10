import 'package:flutter/material.dart';

class AuthLoading extends StatelessWidget {
  const AuthLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade200,
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/splash/vodafone_loading.gif',
          fit: BoxFit.contain,
        ));
  }
}
