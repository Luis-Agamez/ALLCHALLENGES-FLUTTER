class Pizza {
  final String name;
  final String pricipal;
  final String description;
  final double price;
  final double stars;
  final int slices;
  final double calories;
  final double diameter;
  final List<String> sizes;
  final List<String> ingredients;
  final String image;

  Pizza(
      {required this.name,
      required this.pricipal,
      required this.description,
      required this.price,
      required this.stars,
      required this.slices,
      required this.calories,
      required this.diameter,
      required this.sizes,
      required this.ingredients,
      required this.image});
}
