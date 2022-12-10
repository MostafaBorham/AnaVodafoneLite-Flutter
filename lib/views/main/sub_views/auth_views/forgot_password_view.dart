import 'package:ana_vodafone_lite/shared/route/app_routes.dart';
import 'package:ana_vodafone_lite/shared/widgets/auth_error.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_text_form_field.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/auth_views/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late Size _viewSize;
  final ForgotPasswordViewModel _forgotPasswordViewModel=ForgotPasswordViewModel();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _reNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() => AppBar(
        leading: IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black54,
            )),
        titleSpacing: 0,
        title: Text(
          'Back',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Colors.black),
        ),
      );

  Widget _buildBody() =>Padding(
    padding: EdgeInsets.symmetric(
        horizontal: _viewSize.width * 0.05,
        vertical: _viewSize.height * 0.05),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reset password',style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(
          height: 10,
        ),
        true? _buildThreeStepUi() : (true)? _buildFirstStepUi() : _buildSecondStepUi(),
      ],
    ),
  );
  Widget _buildFirstStepUi() => Column(
        children: [
          Text('In these steps, you will simply get a temporary password, then create a new password of your choice',style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w300,
            height: 1.5
          ),),
          SizedBox(height: 15,),
          if(true) AuthError(message: 'This is Error'),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            controller: _numberController,
            obscureText: false,
            keyboardType: TextInputType.number,
            hintText: 'Enter mobile number',
            onChanged: (input) {},
            validator: (input) {},
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            height: _viewSize.height * 0.1,
            child: WebView(
              onWebViewCreated: (controller) {
                controller.loadUrl('assets/webpages/captcha.html');
              },
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: Set.from([
                JavascriptChannel(
                    name: 'CAPTCHA',
                    onMessageReceived: (message) {
                      print('java message= ${message.message}');
                    })
              ]),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomFullButton(
              width: double.infinity,
              verticalPadding: 15,
              borderRadius: 5,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              onPressed: () {},
              backgroundColor: const Color(0xff901515),
              foregroundColor: Colors.white,
              text: 'Send SMS',
              elevation: 0)
        ],
      );
  Widget _buildSecondStepUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Please complete steps to create a new password of your choice.',style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black54,
            fontWeight: FontWeight.w300,
            height: 1.5
          ),),
          SizedBox(height: 20,),
          if(true) AuthError(message: 'This is Error'),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: _numberController,
            obscureText: false,
            keyboardType: TextInputType.number,
            hintText: 'Enter mobile number',
            enabled: false,
            onChanged: (input) {},
            validator: (input) {},
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            controller: _codeController,
            obscureText: false,
            keyboardType: TextInputType.number,
            hintText: 'Type the code',
            onChanged: (input) {},
            validator: (input) {},
            suffixIcon: true
                ? Text.rich(
              TextSpan(
                  text: 'Resend within  ',
                  children: [TextSpan(text: '60 Sec')]),
              textAlign: TextAlign.left,
              maxLines: 1,
            )
                : TextButton(
              onPressed: () {},
              child: Text(
                'Resend Code',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  shadows: [
                    const Shadow(color: Colors.red, offset: Offset(0, -3))
                  ],
                  fontWeight: FontWeight.bold,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationThickness: 2,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          CustomFullButton(
              width: double.infinity,
              verticalPadding: 15,
              borderRadius: 5,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              onPressed: () {},
              backgroundColor:Colors.red,
              foregroundColor: Colors.white,
              text: 'Verify Code',
              elevation: 0)
        ],
      );
  Widget _buildThreeStepUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'You almost there, please add you new password',
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 15,
      ),
      CustomTextFormField(
        controller: _newPasswordController,
        obscureText: true,
        keyboardType: TextInputType.text,
        hintText: 'New Password',
        onChanged: (input) {},
        validator: (input) {},
        suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(true ? Icons.visibility_off : Icons.visibility)),
      ),
      SizedBox(
        height: 10,
      ),
      CustomTextFormField(
        controller: _reNewPasswordController,
        obscureText: true,
        keyboardType: TextInputType.text,
        hintText: 'Retype new password',
        onChanged: (input) {},
        validator: (input) {},
        suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(true ? Icons.visibility_off : Icons.visibility)),
      ),
      SizedBox(
        height: 15,
      ),
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Your password must include the following:',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.black87),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      LinearProgressIndicator(
        minHeight: 5,
        color: true
            ? Colors.red
            : (true)
            ? Colors.orange
            : Colors.green,
        value: 0.5,
        backgroundColor: Colors.grey.shade400,
      ),
      SizedBox(
        height: 10,
      ),
      Column(
        children: _forgotPasswordViewModel.passwordTerms
            .map((term) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Icon(
                true ? Icons.circle_outlined : Icons.check_circle,
                color: true ? Colors.green : Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  term,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                      color: true ? Colors.green : Colors.grey),
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
      SizedBox(
        height: 10,
      ),
      CustomFullButton(
          width: double.infinity,
          verticalPadding: 15,
          borderRadius: 5,
          textStyle: Theme.of(context).textTheme.labelLarge!,
          fontWeight: FontWeight.w400,
          onPressed: true ? () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.authSuccessViewRoute);
          } : null,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          text: 'Submit',
          elevation: 0)
    ],
  );
}
