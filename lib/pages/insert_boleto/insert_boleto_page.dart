import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:payflow/pages/insert_boleto/insert_boleto_controller.dart';

import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text.dart';
import 'package:payflow/shared/widgets/set_label_button/set_label_button.dart';

class InsertBoletoPage extends StatelessWidget {
  final String? barcode;
  InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  final controler = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  final dueDateInputController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 69,
                  vertical: 24,
                ),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: controler.formKey,
                child: Column(
                  children: [
                    InputTextWidget(
                      label: "Nome do boleto",
                      icon: FontAwesomeIcons.fileAlt,
                      validator: controler.validateName,
                      onChanged: (value) {
                        controler.onChange(name: value);
                      },
                    ),
                    InputTextWidget(
                      controller: dueDateInputController,
                      validator: controler.validateVencimento,
                      label: "Vencimento",
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        controler.onChange(dueDate: value);
                      },
                    ),
                    InputTextWidget(
                      controller: moneyInputTextController,
                      validator: (_) => controler.validateValor(
                        moneyInputTextController.numberValue,
                      ),
                      label: "Valor",
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) {
                        controler.onChange(
                          value: moneyInputTextController.numberValue,
                        );
                      },
                    ),
                    InputTextWidget(
                      initialValue: barcode,
                      validator: controler.validateCodigo,
                      controller: barcodeInputController,
                      label: "Código",
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        controler.onChange(barcode: value);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Get.back();
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () async {
          await controler.cadastrarBoleto();
          Get.back();
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
