import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? customStyle;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.customStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: customStyle ?? TextStyles.buttonHeading,
          ),
        ),
      ),
    );
  }
}
