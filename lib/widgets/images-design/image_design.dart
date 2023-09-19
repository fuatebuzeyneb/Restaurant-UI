part of '../../import_path.dart';

class ImagesDesign extends StatelessWidget {
  const ImagesDesign(
      {super.key, required this.imagePath, this.imageSize = 30.0});
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