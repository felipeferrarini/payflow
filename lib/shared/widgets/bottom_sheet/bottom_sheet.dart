import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/set_label_button/set_label_button.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subTitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              height: size.width * 0.40,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: AppColors.background,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyles.buttonBoldHeading,
                  ),
                  Text(
                    subTitle,
                    style: TextStyles.buttonHeading,
                  ),
                ],
              ),
            ),
            SetLabelButtons(
              primaryLabel: primaryLabel,
              primaryOnPressed: primaryOnPressed,
              secondaryLabel: secondaryLabel,
              secondaryOnPressed: secondaryOnPressed,
            )
          ],
        ),
      ),
    );
  }
}
