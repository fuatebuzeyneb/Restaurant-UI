part of '../../import_path.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                        height: size.height * 0.15,
                        width: size.height * 0.15,
                        imageUrl: AppImagesPath.pizzaTest,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const TitlesTextWidget(label: 'Mix Pizza'),
                      const SizedBox(
                        width: 65,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red[800],
                        size: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.heart_broken,
                        color: Colors.red[800],
                        size: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const SubtitleTextWidget(label: '4.5'),
                    ],
                  ),
                  Row(
                    children: [
                      const SubtitleTextWidget(label: '\$15'),
                      const SizedBox(
                        width: 90,
                      ),
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            elevation: 2,
                            side:
                                const BorderSide(width: 1, color: Colors.grey)),
                        onPressed: () async {
                          await showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              context: context,
                              builder: (context) {
                                return QuantityBtmSheetWidget();
                              });
                        },
                        icon: const Icon(IconlyLight.arrow_down),
                        label: const Text(
                          'Qty: 1',
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
