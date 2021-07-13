import 'package:flutter/material.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? Function(String value) onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        constraints: BoxConstraints(maxHeight: 48),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.stroke,
              width: 1,
            ),
          ),
        ),
        child: TextFormField(
          initialValue: initialValue,
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          style: TextStyles.inputBoldBackground,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyles.inputBoldBackground,
            icon: Container(
              height: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 19),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: AppColors.stroke,
                    width: 1,
                  ),
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
