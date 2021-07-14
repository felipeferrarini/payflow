import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/controller/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class AppBarWidget extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.amber.shade500, AppColors.primary],
          radius: 1,
          center: Alignment(0.0, 1.0),
        ),
      ),
      child: Center(
        child: ListTile(
          title: Obx(
            () => Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                    text: authController.user.displayName,
                    style: TextStyles.titleBoldBackground,
                  )
                ],
              ),
            ),
          ),
          subtitle: Text(
            'Mantenha suas contas em dia',
            style: TextStyles.captionShape,
          ),
          trailing: InkWell(
            onTap: () {
              Get.toNamed("/user_info");
            },
            child: Obx(
              () => Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(authController.user.photoURL ?? ''),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
