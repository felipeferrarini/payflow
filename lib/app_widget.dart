import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/barcode/barcode_page.dart';
import 'package:payflow/pages/home/home_page.dart';
import 'package:payflow/pages/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/pages/login/login_page.dart';
import 'package:payflow/pages/splash/splash_page.dart';
import 'package:payflow/pages/user_info/user_info.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      unknownRoute: GetPage(name: '/home', page: () => HomePage()),
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(
          name: '/barcode',
          page: () => BarcodePage(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/insert_boleto',
          page: () => InsertBoletoPage(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 500),
        ),
        GetPage(
          name: '/user_info',
          page: () => UserInfoPage(),
          transition: Transition.downToUp,
          transitionDuration: Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
