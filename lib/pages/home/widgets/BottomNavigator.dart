import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              controller.setPage(0);
            },
            icon: Icon(
              Icons.home,
              color: AppColors.primary,
              size: 30,
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
                Get.toNamed('/barcode');
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
              controller.setPage(1);
            },
            icon: Icon(
              Icons.description_outlined,
              color: AppColors.body,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
