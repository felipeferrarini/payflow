import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/barcode/barcode_page.dart';
import 'package:payflow/pages/home/home_page.dart';
import 'package:payflow/pages/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/pages/login/login_page.dart';
import 'package:payflow/pages/splash/splash_page.dart';
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
      unknownRoute: GetPage(name: '/notfound', page: () => SplashPage()),
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/barcode', page: () => BarcodePage()),
        GetPage(name: '/insert_boleto', page: () => InsertBoletoPage()),
      ],
    );
  }
}
