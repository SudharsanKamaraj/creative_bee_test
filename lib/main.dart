import 'package:creative_bee_task/util/index_path.dart';

const storeLocal = FlutterSecureStorage();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      home: SplashScreen(),
    );
  }
}
