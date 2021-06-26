import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var _isAuthenticated = false.obs;
  Rx<UserCredential?> _user = null.obs;

  get user => _user;
  get isAuthenticated => _isAuthenticated;

  void setUser(UserCredential user) {
    _user = user.obs;
    _isAuthenticated = true.obs;
    Get.offAllNamed("/home");
  }

  void loginFailure() {
    _isAuthenticated = false.obs;
    _user = null.obs;
    Get.offAllNamed("/login");
  }
}
