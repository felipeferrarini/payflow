import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list.dart';
import 'package:payflow/shared/controller/boleto_list/boleto_list_controller.dart';

class MeusBoletosPage extends StatelessWidget {
  final controller = Get.find<BoletoListController>();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      duration: Duration(milliseconds: 150),
      initDelay: Duration.zero,
      child: Stack(
        children: [
          Container(
            height: 40,
            color: AppColors.primary,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Obx(
                  () => BoletoInfo(size: controller.boletos.length),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meus boletos",
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
        ],
      ),
    );
  }
}
