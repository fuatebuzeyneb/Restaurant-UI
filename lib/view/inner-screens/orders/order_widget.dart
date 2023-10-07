part of '../../../import_path.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 150,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkPrimaryColor
                    : AppColors.lightPrimaryColor,
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.darkCardColor
                      : AppColors.lightCardColor,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            Positioned(
              top: -8,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 140,
                width: 200,
                child: Image.asset(
                  AppImagesPath.pizza8,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 150,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        "Pizza Mix",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        "X4",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30, // 30 padding
                        vertical: 8 / 4, // 5 top and bottom
                      ),
                      decoration: BoxDecoration(
                        color: themeProvider.getIsDarkTheme
                            ? AppColors.darkPrimaryColor
                            : AppColors.lightPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(22),
                          topLeft: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "\$100",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
