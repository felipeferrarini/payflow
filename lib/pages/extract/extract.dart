import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class ExtractPage extends StatelessWidget {
  final controller = Get.find<BoletoListController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      duration: Duration(milliseconds: 150),
      initDelay: Duration.zero,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Meus extratos",
                  style: TextStyles.titleBoldHeading,
                ),
                Text(
                  "${controller.boletos.length} ao total",
                  style: TextStyles.captionBody,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Divider(
                color: AppColors.stroke,
                thickness: 1,
                height: 1,
              ),
            ),
            Expanded(
              child: BoletoList(),
            ),
          ],
        ),
      ),
    );
  }
}
