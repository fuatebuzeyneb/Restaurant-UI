part of '../../import_path.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.name, required this.image});
  final String name, image;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 5),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, SearchScreen.routName,
              arguments: name);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height * 0.14,
              width: size.height * 0.14,
              decoration: BoxDecoration(
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkCardColor
                    : AppColors.lightCardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: themeProvider.getIsDarkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: size.height * 0.04,
              top: -5,
              child: Image.asset(
                image,
                height: 50,
                width: 50,
              ),
            ),
            Positioned(
              right: size.height * 0.002,
              top: 2,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.darkPrimaryColor
                      : AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Positioned(
              left: size.height * 0.002,
              bottom: 2,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.darkPrimaryColor
                      : AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkPrimaryColor
                    : AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),*/