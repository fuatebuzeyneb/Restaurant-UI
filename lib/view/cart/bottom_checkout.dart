part of '../../import_path.dart';

class BottomCheckout extends StatelessWidget {
  const BottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.purple,
      ),
      height: kBottomNavigationBarHeight + 30,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlesTextWidget(label: 'label'),
                  SubtitleTextWidget(label: '16.22'),
                ],
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 2,
                  side: const BorderSide(width: 1, color: Colors.grey)),
              onPressed: () {},
              child: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
