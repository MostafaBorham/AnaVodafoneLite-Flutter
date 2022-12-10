import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/route/app_routes.dart';
import 'package:ana_vodafone_lite/shared/widgets/auth_error.dart';
import 'package:ana_vodafone_lite/shared/widgets/auth_loading.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_full_button.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_text_form_field.dart';
import 'package:ana_vodafone_lite/shared/widgets/step_progress_view.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/auth_views/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late Size _viewSize;
  Stream<int>? _codeTimerStream;
  final GlobalKey<FormState> _mobileNumberFormKey=GlobalKey<FormState>();
  final RegisterViewModel _registerViewModel = RegisterViewModel();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _codeTimerStream?.listen((currentSecond) {
      _registerViewModel.codeTimer=currentSecond;
      setState(() {});
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
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

  _buildBody() => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _viewSize.width * 0.05,
            vertical: _viewSize.height * 0.05),
        child: true ? _buildRegisterStepsUi() : const AuthLoading(),
      );
  Widget _buildRegisterStepsUi() => Column(
        children: [
          StepProgressView(
            curStep: _registerViewModel.currentStep,
            titles: _registerViewModel.statueProgressTitles,
            width: _viewSize.width * 0.8,
          ),
          SizedBox(
            height: _viewSize.height * 0.05,
          ),
          Expanded(
              child: true
                  ? _buildAlmostDoneStepUi()
                  : (true)
                      ? _buildPhoneNumberStepUi()
                      : _buildVerifyNumberStepUi())
        ],
      );
  Widget _buildPhoneNumberStepUi() => Column(
        children: [
          Text('Get full control on your line'),
          SizedBox(
            height: 10,
          ),
          if(true) const AuthError(message: 'This is Error'),
          SizedBox(
            height: 15,
          ),
          Form(
            key: _mobileNumberFormKey,
            child: CustomTextFormField(
              controller: _numberController,
              obscureText: false,
              keyboardType: TextInputType.number,
              hintText: 'Enter mobile number',
              onChanged: (input) {},
              validator: (input) {},
            ),
          ),
          SizedBox(
            height: 10,
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
            height: 10,
          ),
          CustomFullButton(
              width: double.infinity,
              verticalPadding: 15,
              borderRadius: 5,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              onPressed: () {
                if(_mobileNumberFormKey.currentState!.validate()){

                }
              },
              backgroundColor: const Color(0xff901515),
              foregroundColor: Colors.white,
              text: 'Send SMS',
              elevation: 0)
        ],
      );
  Widget _buildVerifyNumberStepUi() {
    _codeTimerStream??=_buildCodeStream();
    return Column(
        children: [
          Text('Enter the code sent to you via SMS'),
          SizedBox(
            height: 10,
          ),
          const AuthError(message: 'Code Invalid'),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            controller: _numberController,
            enabled: false,
            obscureText: false,
            keyboardType: TextInputType.number,
            hintText: '01005267056',
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _codeController,
            obscureText: false,
            keyboardType: TextInputType.number,
            hintText: 'Type the code',
            onChanged: (input) {},
            validator: (input) {},
            suffixIcon: _registerViewModel.codeTimer>AppConstants.INT_ZERO
                ? Text.rich(
                    TextSpan(
                        text: _registerViewModel.codeResendPrefix,
                        children: [TextSpan(text: '${_registerViewModel.codeTimer}${_registerViewModel.codeResendSuffix}')]),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  )
                : TextButton(
                    onPressed: () {
                      _codeTimerStream=_buildCodeStream();
                    },
                    child: Text(
                      _registerViewModel.resendCodeBtn,
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
            height: 10,
          ),
          CustomFullButton(
              width: double.infinity,
              verticalPadding: 15,
              borderRadius: 5,
              textStyle: Theme.of(context).textTheme.labelLarge!,
              fontWeight: FontWeight.w400,
              onPressed: () {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              text: 'Verify Code',
              elevation: 0)
        ],
      );
  }
  Widget _buildAlmostDoneStepUi() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'We encourage you to create a strong password',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            controller: _nameController,
            obscureText: false,
            keyboardType: TextInputType.name,
            hintText: 'Your Name',
            onChanged: (input) {},
            validator: (input) {},
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            hintText: 'Password',
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
            controller: _rePasswordController,
            obscureText: true,
            keyboardType: TextInputType.text,
            hintText: 'Confirm Password',
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
            children: _registerViewModel.passwordTerms
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
              onPressed: true
                  ? () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.authSuccessViewRoute);
                    }
                  : null,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              text: 'Create Account',
              elevation: 0)
        ],
      );

  Stream<int> _buildCodeStream() async* {
    Stream.periodic(const Duration(seconds: AppConstants.SECONDS_IN_MINUTE),(int second){
      return 60-second;
    });
  }
}
