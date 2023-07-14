import 'package:creative_bee_task/util/index_path.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    String isLogin = await storeLocal.read(key: 'isLogin') ?? "false";
    if (isLogin == "true") {
      Get.to(const DashboardScreen());
    } else {
      Get.to(const LoginPage());
    }
  }
}
