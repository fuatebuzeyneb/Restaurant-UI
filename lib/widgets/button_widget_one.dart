part of '../import_path.dart';

class ButtonWidgetOne extends StatelessWidget {
  final double paddingHorizontal, paddingVertical;
  final String text;
  final IconData? image;
  final Function fct;
  const ButtonWidgetOne({
    super.key,
    this.image,
    required this.text,
    this.paddingHorizontal = 15,
    this.paddingVertical = 15,
    required this.fct,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        fct();
      },
      child: Container(
        decoration: BoxDecoration(
            color: themeProvider.getIsDarkTheme
                ? AppColors.darkPrimaryColor
                : AppColors.lightPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(50),
            )),
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal, vertical: paddingVertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: themeProvider.getIsDarkTheme
                      ? Colors.black
                      : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              image,
              color: themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
