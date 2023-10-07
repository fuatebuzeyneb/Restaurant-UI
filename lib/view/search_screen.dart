part of '../import_path.dart';

class SearchScreen extends StatefulWidget {
  static const routName = 'SearchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextController;
  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<ProductModel> productListSearch = [];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            passedCategory ?? 'Search Screen',
            style: TextStyle(
                color:
                    themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),

          backgroundColor: themeProvider.getIsDarkTheme
              ? AppColors.darkScaffoldColor
              : AppColors.lightScaffoldColor,
          //Text('Search Screen'),
          // AppBarTitle(title: 'Search Screen'),
        ),
        body: productList.isEmpty
            ? EmptyPageWidget(
                imagePath: AppImagesPath.Guest,
                title: 'Sorry',
                subTitle: ' No product found')
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(
                        color: themeProvider.getIsDarkTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                      cursorColor: themeProvider.getIsDarkTheme
                          ? Colors.black
                          : Colors.white,
                      controller: searchTextController,
                      decoration: InputDecoration(
                        fillColor: themeProvider.getIsDarkTheme
                            ? AppColors.darkPrimaryColor
                            : AppColors.lightPrimaryColor,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: themeProvider.getIsDarkTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // setState(() {
                            searchTextController.clear();
                            FocusScope.of(context).unfocus();
                            //  });
                          },
                          child: Icon(
                            Icons.clear,
                            color: themeProvider.getIsDarkTheme
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        // setState(() {
                        //   productListSearch = productProvider.searchQuery(
                        //       searchText: searchTextController.text);
                        // });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (searchTextController.text.isNotEmpty &&
                      productListSearch.isEmpty) ...[
                    EmptyPageWidget(
                        imagePath: AppImagesPath.Guest,
                        title: 'Sorry',
                        subTitle: ' No results found')
                  ],
                  Expanded(
                    child: DynamicHeightGridView(
                      itemCount: searchTextController.text.isNotEmpty
                          ? productListSearch.length
                          : productList.length,
                      crossAxisCount: 2,
                      builder: (context, index) {
                        return CardProductWidget(
                          productId: searchTextController.text.isNotEmpty
                              ? productListSearch[index].productId
                              : productList[index].productId,
                          paddingSize: 22,
                          iconSize: 45,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: kBottomNavigationBarHeight - 50,
                  ),
                ],
              ),
      ),
    );
  }
}
