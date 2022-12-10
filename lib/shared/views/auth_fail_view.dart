// ignore_for_file: must_be_immutable

import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthFailView extends StatelessWidget {
  AuthFailView({Key? key}) : super(key: key);
  late Size _viewSize;
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) => Padding(
    padding: EdgeInsets.all(_viewSize.width*0.1),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: _viewSize.width * 0.4,
        ),
        SizedBox(
          height: _viewSize.height * 0.1,
        ),
        Text('Oops!',style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),),
        const SizedBox(
          height: 10,
        ),
        Text('Looks like something went wrong. Please try again later.',textAlign : TextAlign.center,style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),),
        const SizedBox(
          height: 15,
        ),
        CustomFullButton(
            width: double.infinity,
            verticalPadding: 5,
            onPressed: (){
              Navigator.of(context).pop();
            },
            borderRadius: 10,
            textStyle: Theme.of(context).textTheme.labelLarge!,
            fontWeight: FontWeight.w400,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            text: 'Ok',
            elevation: 0)
      ],
    ),
  );
}
