import 'package:ana_vodafone_lite/shared/widgets/app_dialogs.dart';
import 'package:ana_vodafone_lite/view_models/main/sub_view_models/departments/shop_with_us_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShopExploreView extends StatefulWidget {
  const ShopExploreView({Key? key, required this.viewTitle, required this.url})
      : super(key: key);
  final String viewTitle;
  final String url;
  @override
  State<ShopExploreView> createState() => _ShopExploreViewState();
}

class _ShopExploreViewState extends State<ShopExploreView> {
  late Size _viewSize;
  final ShopWithUsViewModel _shopWithUsViewModel = ShopWithUsViewModel();
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    _viewSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.viewTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: true,
        leadingWidth: _viewSize.width * 0.3,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _webViewController.reload();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
                color: Colors.grey),
            if (_shopWithUsViewModel.canBack)
              IconButton(
                  onPressed: () {
                    setState(() {
                      _webViewController.goBack();
                    });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  color: Colors.grey),
          ],
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
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            backgroundColor: Colors.white,
            onWebViewCreated: (controller) => _webViewController = controller,
            onProgress: (progress) => setState(() {
              _shopWithUsViewModel.setWebProgress(progress);
            }),
            onPageFinished: (url) =>
                _webViewController.canGoBack().then((canBack) {
              setState(() {
                _shopWithUsViewModel.setCanBack(canBack);
              });
            }),
          ),
          if (_shopWithUsViewModel.webProgress <
              _shopWithUsViewModel.maxProgress)
            LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: Colors.grey,
              color: Colors.red,
              value: _shopWithUsViewModel.webProgress,
            ),
        ],
      ),
      endDrawer: _buildShopExploreDrawer(),
    );
  }

  Widget _buildShopExploreDrawer() => Drawer(
      backgroundColor: Colors.white,
      width: double.infinity,
      child: ListView(
        children: [
          Container(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                splashColor: Colors.transparent,
                icon: Icon(Icons.clear)),
            alignment: AlignmentDirectional.centerEnd,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade400, Colors.white],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.login,
                color: Colors.redAccent,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text('Login'),
            onTap: () {},
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.redAccent,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text('Shop'),
            onTap: () {},
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.location_on_rounded,
                color: Colors.redAccent,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text('Store locator'),
            onTap: () {},
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.chat,
                color: Colors.redAccent,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text('Follow Us'),
            onTap: () {
              //Go to facebook page
            },
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.settings,
                color: Colors.redAccent,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text('Settings'),
            onTap: () {
              AppDialogs.showMultiActionDialog(
                  context: context,
                  title: 'New App Update',
                  content: 'We update the app regularly to make it better for you, please update the latest version to be able to use this service.',
                  posBtn: 'UPDATE',
                  negBtn: 'LATER',
                  posAction: (){
                    //GO TO PLAY STORE
                  },
                  negAction: (){
                    Navigator.of(context).pop();
                  }
              );
            },
          ),
          DottedLine(
            dashColor: Colors.grey.shade400,
          ),
        ],
      ));
}
