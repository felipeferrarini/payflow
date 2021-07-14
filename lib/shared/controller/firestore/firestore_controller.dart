import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/controller/auth/auth_controller.dart';

class FirestoreController {
  final authController = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
