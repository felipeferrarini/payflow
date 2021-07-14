import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:payflow/shared/models/user_credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Rx<Object> _user = Object().obs;

  User get user => _user.value as User;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  Future<void> createUserDocument(String userUid) async {
    final userExist =
        await users.doc(userUid).get().then((value) => value.exists);

    if (!userExist) {
      await users.doc(userUid).set({'boletos': []});
    }
  }

  void setUser(User user) {
    _user.value = user;

    createUserDocument(user.uid);

    if (Get.currentRoute != "/home") {
      Get.offNamed("/home");
    }

    return;
  }

  void loginFailure() {
    _user.value = Object();
    if (Get.currentRoute != "/login") {
      Get.offAllNamed("/login");
    }
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
      if (userCredential.user != null) {
        setUser(userCredential.user!);
      }
    } catch (e) {
      loginFailure();
    }
  }

  Future<void> socialSignOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed("/login");
  }
}
