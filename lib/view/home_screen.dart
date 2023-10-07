part of '../import_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
              color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Swiper(
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstans.banners[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstans.banners.length,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Latest Arrival",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: themeProvider.getIsDarkTheme
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.27,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.getProducts.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: productProvider.getProducts[index],
                        child: LatestArrivalWidget());
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: themeProvider.getIsDarkTheme
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: size.height * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstans.categoriesList.length,
                  itemBuilder: (context, index) {
                    return CategoriesWidget(
                        name: AppConstans.categoriesList[index].name,
                        image: AppConstans.categoriesList[index].image);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
