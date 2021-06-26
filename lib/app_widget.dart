import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/home/home_page.dart';
import 'package:payflow/pages/login/login_page.dart';
import 'package:payflow/pages/splash/splash_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      unknownRoute: GetPage(name: '/notfound', page: () => SplashPage()),
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage()),
      ],
    );
  }
}
