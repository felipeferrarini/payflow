import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Center(child: Image.asset(AppImages.union)),
            Center(child: Image.asset(AppImages.logoFull)),
          ],
        ),
      ),
    );
  }
}
