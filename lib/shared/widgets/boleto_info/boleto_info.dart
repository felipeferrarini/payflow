import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';

class BoletoInfo extends StatelessWidget {
  final int size;

  const BoletoInfo({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
            ),
            Text.rich(TextSpan(
              text: "Você tem ",
              style: TextStyles.captionBackground,
              children: [
                TextSpan(
                    text: "$size boletos\n",
                    style: TextStyles.captionBoldBackground),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: TextStyles.captionBackground,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
