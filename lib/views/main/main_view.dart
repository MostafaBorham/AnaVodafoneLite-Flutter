import 'package:ana_vodafone_lite/shared/constants/app_constants.dart';
import 'package:ana_vodafone_lite/shared/route/app_routes.dart';
import 'package:ana_vodafone_lite/shared/widgets/custom_text_form_field.dart';
import 'package:ana_vodafone_lite/view_models/main/main_view_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late Size _viewSize;

  final TextEditingController _mobileNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final MainViewModel _mainViewModel = const MainViewModel();

  final List<String?> _views = const [
    AppRoutes.shopWithUsViewRoute,
    null,
    AppRoutes.storeLocatorViewRoute,
    AppRoutes.exploreViewRoute
  ];

  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() => SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppConstants.VODAFONE_LOGO,
                    fit: BoxFit.contain,
                    width: _viewSize.width * 0.11,
                    height: _viewSize.width * 0.11,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black45,
                        side: const BorderSide(color: Colors.black45),
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        padding: EdgeInsets.symmetric(
                            horizontal: _viewSize.width * 0.07,
                            vertical: _viewSize.width * 0.03)),
                    child: Text(_mainViewModel.langBtn),
                  )
                ],
              ),
              SizedBox(
                height: _viewSize.height * 0.05,
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(_mainViewModel.viewTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ),
                subtitle: Text.rich(
                  TextSpan(
                      text: _mainViewModel.viewSubtitle1,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.w400, height: 1.2),
                      children: [
                        TextSpan(
                            text: _mainViewModel.viewSubtitle2,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold))
                      ]),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              SizedBox(
                height: _viewSize.height * 0.05,
              ),
              _buildUiInWifiStatue(context)
            ],
          ),
        ),
      ));
  Widget _buildUiInWifiStatue(BuildContext context) => Column(
        children: [
          Form(
              child: SizedBox(
            height: _viewSize.height * 0.27,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextFormField(
                  controller: _mobileNumberController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  hintText: _mainViewModel.mobileHint,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: _mainViewModel.passwordHint,
                  suffixIcon: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.forgotPasswordViewRoute);
                      },
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent)),
                      child: Text(
                        _mainViewModel.forgotBtn,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(decoration: TextDecoration.underline),
                      )),
                ),
                SizedBox(
                  width: double.infinity,
                  height: _viewSize.height * 0.06,
                  child: OutlinedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          foregroundColor: Colors.white,
                          textStyle: Theme.of(context).textTheme.titleMedium),
                      child: Text(_mainViewModel.loginBtn)),
                ),
              ],
            ),
          )),
          SizedBox(
            height: _viewSize.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_mainViewModel.haveAccountMessage,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w400)),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.registerViewRoute);
                },
                child: Text(
                  _mainViewModel.registerBtn,
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
              )
            ],
          ),
          SizedBox(
            height: _viewSize.height * 0.01,
          ),
          true
              ? Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  margin:
                      EdgeInsets.symmetric(horizontal: _viewSize.width * 0.03),
                  child: ListTile(
                    leading: const Icon(
                      Icons.wifi_tethering_outlined,
                      color: Colors.red,
                    ),
                    title: Text(_mainViewModel.mobileRegisterMessageTitle,
                        style: Theme.of(context).textTheme.bodySmall),
                    subtitle: Text(_mainViewModel.mobileRegisterMessageSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.green)),
                    trailing: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.green,
                    ),
                    dense: true,
                    contentPadding: const EdgeInsets.all(10),
                    minLeadingWidth: _viewSize.width * 0.1,
                    horizontalTitleGap: 0,
                  ),
                )
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    _mainViewModel.backToAccsBtn,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      shadows: [
                        const Shadow(color: Colors.black, offset: Offset(0, -3))
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
        ],
      );

  Widget _buildUiInMobileDataStatue(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<String>(
            future: Future.delayed(
                Duration.zero,
                () =>
                    '0000000'), //will add future method that returned sim number
            builder: (context, simNumber) => Card(
              color: Colors.red,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: simNumber.hasData
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _viewSize.width * 0.03,
                          horizontal: _viewSize.width * 0.05),
                      child: Column(
                        children: [
                          Text(
                            _mainViewModel.continueAsTxt,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            _mainViewModel.simTxt,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                          Text(
                            simNumber.data!,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.sim_card,
                            size: _viewSize.width * 0.25,
                          )
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(
            height: _viewSize.height * 0.03,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: Colors.grey,
                    size: _viewSize.width * 0.1,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _mainViewModel.moreAccountMsgTitle,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            wordSpacing: 0,
                            letterSpacing: 0),
                      ),
                      Text(
                        _mainViewModel.moreAccountMsgSubtitle,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            wordSpacing: 0),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: Theme.of(context)
                              .textButtonTheme
                              .style
                              ?.copyWith(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => Colors.red),
                                minimumSize: MaterialStateProperty.resolveWith(
                                    (states) => Size.zero),
                                padding: MaterialStateProperty.resolveWith(
                                    (states) => const EdgeInsets.symmetric(
                                        vertical: 10)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                          child: Text(_mainViewModel.newAccountBtn)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildBottomNavigationBar() => Container(
        height: _viewSize.height * 0.085,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ]),
        child: BottomNavigationBar(
          items: _mainViewModel.items,
          currentIndex: _mainViewModel.navigationBarCurrentIndex,
          onTap: (index) => _views[index] == null
              ? null
              : Navigator.of(context).pushNamed(_views[index]!),
        ),
      );
}
