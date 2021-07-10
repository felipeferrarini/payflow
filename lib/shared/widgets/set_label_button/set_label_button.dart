import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width * 0.15,
      decoration: BoxDecoration(
        color: AppColors.shape,
        border: Border(
          top: BorderSide(color: AppColors.stroke),
        ),
      ),
      child: Row(
        children: [
          LabelButton(
            label: primaryLabel,
            onPressed: primaryOnPressed,
            customStyle: TextStyles.buttonPrimary,
          ),
          DividerVertical(),
          LabelButton(
            label: secondaryLabel,
            onPressed: secondaryOnPressed,
          )
        ],
      ),
    );
  }
}
