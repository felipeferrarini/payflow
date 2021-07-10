import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/home/home_controller.dart';
import 'package:payflow/pages/home/widgets/AppBarWidget.dart';
import 'package:payflow/pages/home/widgets/BottomNavigator.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.19),
        child: AppBarWidget(),
      ),
      body: Obx(() => pages[controller.currentPage.value]),
      bottomNavigationBar: BottomNavigator(controller: controller),
    );
  }
}
