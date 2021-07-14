import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/controller/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile.dart';

class BoletoList extends StatelessWidget {
  final controller = Get.find<BoletoListController>();

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      if (controller.boletos.length == 0) {
        return Center(
          child: Text(
            "Ops, parece que você ainda não possui boletos cadastrados",
            style: TextStyles.titleListTile,
            textAlign: TextAlign.center,
          ),
        );
      }

      return ListView.builder(
        itemCount: controller.boletos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return AnimatedCard(
            duration: Duration(milliseconds: 150),
            direction: AnimatedCardDirection.right,
            child: BoletoTile(
              data: controller.boletos[index],
            ),
          );
        },
      );
    }));
  }
}
