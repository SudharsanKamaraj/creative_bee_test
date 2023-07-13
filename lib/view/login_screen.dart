import 'package:creative_bee_task/util/index_path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  bool isValidForm = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late String _emailInputVal = "";
  late String _passwordInputVal = "";
  bool isVisible = true;
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.LOGO,
                width: size.width * 0.7,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    final isValidEmail = authController.isValidEmail.value;
                    if (value!.isEmpty || !isValidEmail) {
                      return AppString.PLZ_ENTER_EMAIL;
                    }
                    return null;
                  },
                  onChanged: (inputValue) {
                    _emailInputVal = inputValue;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: AppString.EMAIL,
                    hintStyle: const TextStyle(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: Colors.black26,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_LARGE),
                  ),
                ),
              ),
              SizedBox(
                height: 85,
                child: TextFormField(
                  controller: passwordController,
                  validator: (inputValue) {
                    if (inputValue!.isEmpty) {
                      return AppString.PLZ_ENTER_PASS;
                    }
                    return null;
                  },
                  onChanged: (inputValue) {
                    _passwordInputVal = inputValue;
                  },
                  focusNode: textFieldFocusNode,
                  obscuringCharacter: "*",
                  obscureText: _obscured,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      child: GestureDetector(
                          onTap: _toggleObscured,
                          child: _obscured
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: AppString.PASSWORD,
                    hintStyle: const TextStyle(
                      fontFamily: 'Averta-SemiBold',
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: Colors.black26,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_LARGE,
                        vertical: Dimensions.PADDING_SIZE_LARGE),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SizedBox(
                height: Dimensions.BUTTON_HEIGHT,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        isValidForm = true;
                      });
                    } else {
                      setState(() {
                        isValidForm = false;
                      });
                    }
                    authController.validateEmail(_emailInputVal);
                    authController.login(
                        emailController.text, passwordController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFE41636),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text(
                    AppString.LOGIN,
                    style: TextStyle(
                      fontFamily: 'Averta-Bold',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
