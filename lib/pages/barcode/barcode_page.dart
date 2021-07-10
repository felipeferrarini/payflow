import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/barcode/barcode_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:payflow/shared/widgets/set_label_button/set_label_button.dart';

class BarcodePage extends StatelessWidget {
  final controller = Get.put(BarcodeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Obx(() {
            if (controller.status.showCamera) {
              return Container(
                child: controller.status.cameraController!.buildPreview(),
              );
            }

            return Container();
          }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backwardsCompatibility: false,
                backgroundColor: Colors.black,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: TextStyles.buttonBackground,
                ),
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () {},
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnPressed: () {},
              ),
            ),
          ),
          Obx(() {
            if (controller.status.hasError) {
              return BottomSheetWidget(
                title: 'Não foi possível identificar um código de barras.',
                subTitle:
                    'Tente escanear novamente ou digite o código do seu boleto.',
                primaryLabel: 'Escanear novamente',
                primaryOnPressed: () {
                  controller.getAvailableCameras();
                },
                secondaryLabel: 'Digitar código',
                secondaryOnPressed: () {},
              );
            }
            return Container();
          })
        ],
      ),
    );
  }
}
