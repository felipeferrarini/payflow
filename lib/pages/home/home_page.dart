import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomeController());
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.amber.shade500, AppColors.primary],
              radius: 1,
              center: Alignment(0.0, 1.0),
            ),
          ),
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: 'Felipe',
                      style: TextStyles.titleBoldBackground,
                    )
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() => pages[controller.currentPage.value]),
      bottomNavigationBar: Container(
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
            GestureDetector(
              onTap: () {
                print('Clicou');
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                    size: 25,
                  ),
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
      ),
    );
  }
}
