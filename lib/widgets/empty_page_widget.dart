part of '../import_path.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});
  final String imagePath, title, subTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            ImagesDesign(
              imagePath: imagePath,
              imageSize: size.height * 0.25,
            ),
            SizedBox(
              height: 15,
            ),
            TitlesTextWidget(label: title),
            SizedBox(
              height: 10,
            ),
            SubtitleTextWidget(label: subTitle),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
    );
  }
}
