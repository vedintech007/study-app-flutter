import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() {
    navigateToIntroduction();
  }

  void navigateToIntroduction() async {
    await Future.delayed(const Duration(seconds: 5)).then(
      (value) => Get.offAllNamed("/introduction"),
    );
    // Get.offAllNamed("/introduction");
  }
}
