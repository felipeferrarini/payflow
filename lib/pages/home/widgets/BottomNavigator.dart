import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class BottomNavigator extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              controller.setCurrentPage(0);
            },
            icon: Obx(
              () => Icon(
                Icons.home,
                color: controller.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
                size: 30,
              ),
            ),
          ),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: () {
                print('asdasd');
                // Get.toNamed('/barcode');
                Get.toNamed('/insert_boleto');
              },
              icon: Icon(
                Icons.add_box_outlined,
                color: AppColors.background,
                size: 25,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.setCurrentPage(1);
            },
            icon: Obx(
              () => Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
