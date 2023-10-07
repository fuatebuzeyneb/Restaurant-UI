part of '../../import_path.dart';

class LoginScreen extends StatefulWidget {
  static const routName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: themeProvider.getIsDarkTheme
                ? Colors.black
                : Colors.white, // <-- SEE HERE
          ),
          title: Text(
            'Login',
            style: TextStyle(
                color:
                    themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: themeProvider.getIsDarkTheme
              ? AppColors.darkPrimaryColor
              : AppColors.lightPrimaryColor,
        ),
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkPrimaryColor
            : AppColors.lightPrimaryColor,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                        color: themeProvider.getIsDarkTheme
                            ? Colors.black
                            : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'This Restaurant Your Second Home',
                    style: TextStyle(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  clipBehavior: Clip.none,
                  height: size.height * 0.79,
                  decoration: BoxDecoration(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        bottomRight: Radius.circular(200),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Image.asset(
                          themeProvider.getIsDarkTheme
                              ? AppImagesPath.cupcake
                              : AppImagesPath.burger1,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _emailTextController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email address",
                            prefixIcon: Icon(
                              IconlyLight.message,
                            ),
                          ),
                          validator: (value) {
                            return ValidatorsAuthScreens.emailValidator(value);
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            hintText: "*********",
                            prefixIcon: const Icon(
                              IconlyLight.lock,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            return ValidatorsAuthScreens.passwordValidator(
                                value);
                          },
                          onFieldSubmitted: (value) {
                            _loginFct();
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              await Navigator.pushNamed(
                                  context, ForgotScreen.routName);
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: themeProvider.getIsDarkTheme
                                      ? AppColors.darkPrimaryColor
                                      : AppColors.lightPrimaryColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ButtonWidgetTwo(
                          paddingHorizontal: 140,
                          paddingVertical: 12,
                          text: 'Login',
                          fct: () {},
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "OR connect using".toUpperCase(),
                          style: TextStyle(
                            color: themeProvider.getIsDarkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            ButtonWidgetTwo(
                              paddingHorizontal: 50,
                              paddingVertical: 12,
                              text: 'Guest',
                              fct: () {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ButtonWidgetOne(
                              text: 'Google',
                              image: Ionicons.logo_google,
                              paddingHorizontal: 28,
                              paddingVertical: 12,
                              fct: () {},
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?".toUpperCase(),
                              style: TextStyle(
                                color: themeProvider.getIsDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await Navigator.pushNamed(
                                    context, RegisterScreen.routName);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: themeProvider.getIsDarkTheme
                                        ? AppColors.darkPrimaryColor
                                        : AppColors.lightPrimaryColor,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
