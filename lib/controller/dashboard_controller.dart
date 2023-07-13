import 'package:creative_bee_task/util/index_path.dart';

class DashboardController extends GetxController {
  RxString emailAdd = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getEmail();
  }

  Future<void> getEmail() async {
    final String? email = await storeLocal.read(key: 'userEmail');
    emailAdd.value = email ?? '';
    print("===> emailAdd.value: ${emailAdd.value}");
  }

  void showItemDetailsPopup(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  item.img,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: Dimensions.PADDING_SIZE_SMALL,
              ),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          content: Text(
            item.description,
            style: const TextStyle(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    await storeLocal.deleteAll();

    Get.offAll(const LoginPage());
  }
}
