part of '../../import_path.dart';

class ViewedScreen extends StatelessWidget {
  static const routName = 'ViewedScreen';
  const ViewedScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProvider>(context);
    return viewedProvider.getViewedItems.isEmpty
        ? Scaffold(
            body: EmptyPageWidget(
                imagePath: AppImagesPath.profileAllOrder,
                title: 'Viewed now is empty',
                subTitle:
                    'hbfjgdlfkjgdfjglkfdjgkldfjgldfkjgdlkfjgdklm,.mvx,.cjiogud'))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  'Viewed Screen(${viewedProvider.getViewedItems.length})'),
              //Text('Cart Screen'),
              // AppBarTitle(title: 'Cart Screen'),
            ),
            body: DynamicHeightGridView(
              itemCount: viewedProvider.getViewedItems.length,
              crossAxisCount: 2,
              builder: (context, index) {
                return CardProductWidget(
                  productId: viewedProvider.getViewedItems.values
                      .toList()[index]
                      .productId,
                  paddingSize: 22,
                  iconSize: 45,
                );
              },
            ),
          );
  }
}
