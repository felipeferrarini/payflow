import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/extract/extract.dart';
import 'package:payflow/pages/home/home_controller.dart';
import 'package:payflow/pages/home/widgets/AppBarWidget.dart';
import 'package:payflow/pages/home/widgets/BottomNavigator.dart';
import 'package:payflow/pages/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final authController = Get.find<AuthController>();
  final boletosController = Get.put(BoletoListController());

  final pages = [
    MeusBoletosPage(),
    ExtractPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.19),
        child: AppBarWidget(),
      ),
      body: Obx(() => pages[controller.currentPage]),
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
