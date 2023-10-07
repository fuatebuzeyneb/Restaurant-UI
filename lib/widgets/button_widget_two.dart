part of '../import_path.dart';

class ButtonWidgetTwo extends StatelessWidget {
  final double paddingHorizontal, paddingVertical;
  final String text;
  final Function fct;
  const ButtonWidgetTwo({
    super.key,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.text,
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
        child: Text(
          text,
          style: TextStyle(
              color: themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
