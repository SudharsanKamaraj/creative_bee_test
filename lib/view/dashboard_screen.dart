import 'package:creative_bee_task/util/index_path.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _globalKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          AppImages.LOGO,
          width: size.width * 0.5,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
              top: size.height * 0.1,
              right: Dimensions.PADDING_SIZE_DEFAULT,
              left: Dimensions.PADDING_SIZE_DEFAULT),
          children: [
            Image.asset(
              AppImages.LOGO,
              width: size.width * 0.4,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Obx(() {
              final String email = dashboardController.emailAdd.value;
              print("===> email: $email");
              return Text(
                'Email : $email',
                style: const TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT),
              );
            }),
            SizedBox(
              height: size.height * 0.5,
            ),
            const Divider(),
            InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Close",
                    style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),
                  ),
                  Icon(Icons.close)
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Log out",
                    style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),
                  ),
                  Icon(Icons.logout)
                ],
              ),
              onTap: () {
                dashboardController.logout();
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = itemList[index];
          return GestureDetector(
            onTap: () {
              dashboardController.showItemDetailsPopup(context, item);
            },
            child: Container(
              height: size.height * 0.1,
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_LARGE,
                vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
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
            ),
          );
        },
      ),
    );
  }
}
