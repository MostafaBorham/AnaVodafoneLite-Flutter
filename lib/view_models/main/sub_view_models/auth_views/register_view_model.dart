import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';

class RegisterViewModel{
  int currentStep=3;
  int codeTimer=0;
  final String codeResendPrefix='Resend within${AppConstants.SPACE}';
  final String codeResendSuffix='Sec';
  final String resendCodeBtn='Resend Code';
  final List<String> statueProgressTitles=[
    'Phone Number',
    'Verify Number',
    'Almost Done'
  ];
  final List<String> passwordTerms=[
    '8 or more characters Contains a special character (@#\$%&.^*/_-)',
    'Upper and lowercase letters',
    'At least one number',
    'Password Matched',
  ];
}