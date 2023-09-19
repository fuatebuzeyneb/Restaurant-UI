part of '../../import_path.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.pink,
      period: const Duration(seconds: 12),
      child: TitlesTextWidget(
        label: title,
        fontSize: 20,
      ),
    );
  }
}


/*
part of '../../import_path.dart';

class AppImages extends StatelessWidget {
  const AppImages({super.key, required this.imagePath, this.imageSize = 30.0});
  final String imagePath;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Image.asset(
      imagePath,
      height: imageSize,
      color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
    );
  }
}
//size.height * 0.25,
*/