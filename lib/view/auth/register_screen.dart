part of '../../import_path.dart';

class RegisterScreen extends StatefulWidget {
  static const routName = 'RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _userTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;
  late final FocusNode _userFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;
  XFile? _pickedImage;

  late final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool confirmObscureText = true;

  @override
  void initState() {
    _userTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    _userFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _userTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
    _userFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      if (_pickedImage == null) {
        DialogWarningFct.showDialogWarning(
            context: context,
            subtitle: "Make sure to pick up an image",
            fct: () {});
        Fluttertoast.showToast(
          msg: "An account has been created",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
      }
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await DialogWarningFct.showDialogPicker(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {});
      },
      galaryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
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
            'Register',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.021,
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
                        'Register a new account in our restaurant and join us and become one of our large family',
                        style: TextStyle(
                          color: themeProvider.getIsDarkTheme
                              ? Colors.black
                              : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    Container(
                      clipBehavior: Clip.none,
                      height: size.height * 0.75,
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
                            SizedBox(
                                height: size.width * 0.3,
                                width: size.width * 0.3,
                                child: PickImageWidget(
                                  function: () async {
                                    localImagePicker();
                                  },
                                  pickedImage: _pickedImage,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _userTextController,
                              focusNode: _userFocusNode,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Full name",
                                prefixIcon: Icon(
                                  IconlyLight.user,
                                ),
                              ),
                              validator: (value) {
                                return ValidatorsAuthScreens
                                    .displayNamevalidator(value);
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(_emailFocusNode);
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
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
                                return ValidatorsAuthScreens.emailValidator(
                                    value);
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
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                hintText: "Pasword",
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
                                FocusScope.of(context)
                                    .requestFocus(_confirmPasswordFocusNode);
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              controller: _confirmPasswordTextController,
                              focusNode: _confirmPasswordFocusNode,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: confirmObscureText,
                              decoration: InputDecoration(
                                hintText: "Repeat password",
                                prefixIcon: const Icon(
                                  IconlyLight.lock,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      confirmObscureText = !confirmObscureText;
                                    });
                                  },
                                  icon: Icon(
                                    confirmObscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                return ValidatorsAuthScreens
                                    .repeatPasswordValidator(
                                        value: value,
                                        password: _passwordTextController.text);
                              },
                              onFieldSubmitted: (value) {
                                _registerFct();
                              },
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            ButtonWidgetTwo(
                              paddingHorizontal: 140,
                              paddingVertical: 12,
                              text: 'Sign up',
                              fct: () async {
                                _registerFct();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
