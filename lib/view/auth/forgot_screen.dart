part of '../../import_path.dart';

class ForgotScreen extends StatefulWidget {
  static const routName = 'ForgotScreen';
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  late TextEditingController _emailTextController;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailTextController.dispose();
    }
    super.dispose();
  }

  Future<void> _forgotFct() async {
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
            'Forgot password',
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
                  'Please enter the email address you\'d like your password reset information sent to',
                  style: TextStyle(
                    color: themeProvider.getIsDarkTheme
                        ? Colors.black
                        : Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                ),
                child: Image.asset(
                  themeProvider.getIsDarkTheme
                      ? AppImagesPath.forgotdark
                      : AppImagesPath.forgotlight,
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Container(
                clipBehavior: Clip.none,
                height: size.height * 0.25,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                    color: themeProvider.getIsDarkTheme
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _emailTextController,
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonWidgetOne(
                        paddingHorizontal: 60,
                        paddingVertical: 12,
                        text: 'Request link',
                        image: IconlyBold.send,
                        fct: () {},
                      ),
                    ],
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
