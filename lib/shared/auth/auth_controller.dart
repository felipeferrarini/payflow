import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/models/user_credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  Rx<User?> _user = null.obs;

  get user => _user;

  void setUser(User? user) {
    if (user != null) {
      _user = user.obs;
      Get.offAllNamed("/home");
      return;
    }

    loginFailure();
  }

  void loginFailure() {
    _user = null.obs;
    Get.offAllNamed("/login");
  }

  Future<void> saveUserCredential(UserCredentialModel credentials) async {
    final instanse = await SharedPreferences.getInstance();
    instanse.setString('user', credentials.toJson());
    return;
  }

  Future<void> getCurrentUser() async {
    final instanse = await SharedPreferences.getInstance();
    if (instanse.containsKey('user')) {
      final credentials =
          UserCredentialModel.fromJson(instanse.get('user') as String);
      final authCredentials = GoogleAuthProvider.credential(
        accessToken: credentials.accessToken,
        idToken: credentials.idToken,
      );

      print(credentials);
      print(authCredentials);
      socialSignIn(authCredentials);
    } else {
      loginFailure();
    }
  }

  Future<void> socialSignIn(OAuthCredential credential) async {
    try {
      saveUserCredential(UserCredentialModel(
        accessToken: credential.accessToken,
        idToken: credential.idToken,
      ));
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      setUser(userCredential.user);
    } catch (e) {
      loginFailure();
    }
  }

  Future<void> socialSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
