import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class UserInfoPage extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: AppColors.background,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: size.height * 0.15,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.amber.shade500, AppColors.primary],
                radius: 1,
                center: Alignment(0.0, 1.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.08),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(controller.user.photoURL ?? ""),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    controller.user.displayName ?? "Usuário",
                    style: TextStyles.titleHome,
                  ),
                ),
                Text(controller.user.email ?? ""),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.38),
                  child: OutlinedButton.icon(
                    label: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Sair do app",
                        style: TextStyles.captionBoldDelete,
                      ),
                    ),
                    icon: Icon(FontAwesomeIcons.timesCircle),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () async {
                      await controller.socialSignOut();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
