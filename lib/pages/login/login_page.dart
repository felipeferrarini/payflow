import 'package:flutter/material.dart';
import 'package:payflow/pages/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login_button/social_login_button.dart';

class LoginPage extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.36,
                color: AppColors.primary,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Image.asset(
                            AppImages.person,
                            height: size.height * 0.45,
                          ),
                        ),
                        Container(
                          height: size.height * 0.11,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.background.withOpacity(0),
                                AppColors.background,
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.025),
                      child: Image.asset(
                        AppImages.logomini,
                        height: size.height * 0.054,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.025,
                        horizontal: size.width * 0.17,
                      ),
                      child: Text(
                        'Organize seus boletos em um s?? lugar',
                        style: TextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.1,
                      ),
                      child: SocialLoginButton(
                        onTap: controller.googleSignIn,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
