import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payflow/shared/models/boleto_model.dart';

class FirestoreController {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addBoleto(String userUid, BoletoModel boleto) async {
    final userExist =
        await users.doc(userUid).get().then((value) => value.exists);

    if (!userExist) {
      await users.doc(userUid).set({'boletos': []});
    }
  }
}
