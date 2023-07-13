import 'package:creative_bee_task/util/index_path.dart';

class AuthController extends GetxController {
  RxBool isValidEmail = false.obs;

  void validateEmail(String email) {
    const emailRegex = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(emailRegex);
    isValidEmail.value = regex.hasMatch(email);
  }

  Future<void> login(String email, String password) async {
    try {
      await storeLocal.write(key: 'isLogin', value: "true");
      await storeLocal.write(key: 'userEmail', value: email);
      await storeLocal.write(key: 'userPassword', value: password);

      final emailAdd = await storeLocal.read(key: 'userEmail');
      final userPassword = await storeLocal.read(key: 'userPassword');

      print("===> emailAdd: $emailAdd");

      if (emailAdd!.isNotEmpty &&
          isValidEmail == true &&
          userPassword!.isNotEmpty) {
        Get.snackbar(AppString.SUCCESS, AppString.SUCCESS_MSG);
        Get.to(const DashboardScreen());
      } else {
        Get.snackbar(AppString.LOGIN_FAILED, AppString.LOGIN_FAILED_MSG);
      }
    } catch (e) {
      debugPrint("login error : $e");
    }
  }
}
