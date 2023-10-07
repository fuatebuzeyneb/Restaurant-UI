part of '../import_path.dart';

class DialogWarningFct {
  static Future<void> showDialogWarning(
      {required BuildContext context,
      required String subtitle,
      required Function fct,
      String imagePath = AppImagesPath.cupcake,
      bool isError = true}) async {
    await showDialog(
        context: context,
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return AlertDialog(
            backgroundColor: themeProvider.getIsDarkTheme
                ? AppColors.darkPrimaryColor
                : AppColors.lightPrimaryColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  height: 60,
                  width: 60,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'cancel',
                          style: TextStyle(
                              color: themeProvider.getIsDarkTheme
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ok',
                        style: TextStyle(
                            color: themeProvider.getIsDarkTheme
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> showDialogPicker({
    required BuildContext context,
    required Function cameraFCT,
    required Function galaryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return AlertDialog(
            backgroundColor:
                themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.white
                          : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonWidgetOne(
                  text: 'Camera',
                  image: Icons.camera,
                  fct: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonWidgetOne(
                  text: 'Galary',
                  image: Icons.image,
                  fct: () {
                    galaryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonWidgetOne(
                  text: 'Remove',
                  image: Icons.delete,
                  fct: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
