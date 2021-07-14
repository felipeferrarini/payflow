import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController extends GetxController {
  final RxList<BoletoModel> _boletos = <BoletoModel>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<BoletoModel> get boletos => _boletos;
  set boletos(List<BoletoModel> boletos) => _boletos.value = boletos;

  @override
  void onInit() {
    getBoletos();
    super.onInit();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }
}
