class CartItemModels {
  final String image;
  final String title;
  final double price;
  final int count;
  final bool isFavourite;

  const CartItemModels({
    required this.image,
    required this.title,
    required this.price,
    this.count = 1,
    required this.isFavourite,
  });
}
