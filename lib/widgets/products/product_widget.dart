part of '../../import_path.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x33483434),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(right: 10, left: 10),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                    imageUrl: AppImagesPath.pizzaTest,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mix Pizza',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: const Color(0xFF483434),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Icon(IconlyLight.bag_2),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$18',
                        style: GoogleFonts.dmSerifDisplay(
                            color: const Color(0xFF483434),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[800],
                          ),
                          Text(
                            '4.9',
                            style: GoogleFonts.dmSerifDisplay(
                                color: const Color(0xFF483434),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
/*
              Positioned(
                top: 0,
                right: 10,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        //bottomRight: Radius.circular(80),
                      ),
                    ),
                    height: 25,
                    width: 60,
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          '4.9',
                          style: GoogleFonts.dmSerifDisplay(
                              color: const Color(0xFF483434),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
*/
