import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile.dart';

class BoletoList extends StatelessWidget {
  final List<BoletoModel> boletos;
  const BoletoList({
    Key? key,
    required this.boletos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      return ListView.builder(
        itemCount: boletos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return BoletoTile(
            data: boletos[index],
          );
        },
      );
    }));
  }
}
