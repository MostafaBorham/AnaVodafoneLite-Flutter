import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'shared/route/app_router.dart';
import 'shared/route/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AnaVodafoneLiteApp());
}

class AnaVodafoneLiteApp extends StatelessWidget {
  const AnaVodafoneLiteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                  shadowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent))),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 3),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(letterSpacing: 0, wordSpacing: 0),
            selectedLabelStyle:
                Theme.of(context).textTheme.labelSmall?.copyWith(
                      letterSpacing: 0,
                      wordSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black54,
            showUnselectedLabels: true,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent))),
          textTheme: const TextTheme(
              bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            wordSpacing: 0,
          ))),
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.internetOfferViewRoute,
    );
  }
}
