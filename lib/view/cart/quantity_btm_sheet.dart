part of '../../import_path.dart';

class QuantityBtmSheetWidget extends StatelessWidget {
  const QuantityBtmSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.grey),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print('index: ${index + 1}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: SubtitleTextWidget(
                      label: '${index + 1}',
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
