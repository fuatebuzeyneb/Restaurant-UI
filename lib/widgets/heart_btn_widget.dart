part of '../import_path.dart';

class HeartBtnWidget extends StatefulWidget {
  const HeartBtnWidget(
      {super.key,
      required this.size,
      required this.productId,
      required this.color});
  final double size;
  final Color color;
  final String productId;

  @override
  State<HeartBtnWidget> createState() => _HeartBtnWidgetState();
}

class _HeartBtnWidgetState extends State<HeartBtnWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return InkWell(
      onTap: () {
        wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
      },
      child: Icon(
        wishlistProvider.isProductInWishlist(productId: widget.productId)
            ? IconlyBold.heart
            : IconlyLight.heart,
        size: widget.size,
        color: widget.color,
      ),
    );
  }
}
