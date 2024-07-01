enum Category {
  cereals,
  pulsesAndLegumes,
  vegetables,
  fruits,
  milkAndMilkProducts,
  nonVegetarian,
  snacks,
  beverages
}
const List<String> categoryNames = [
  'Cereals',
  'Pulses and Legumes',
  'Vegitables',
  'Fruits',
  'Milk and Milk Products',
  'Non-Vegitarian',
  'Snacks',
  'Beverages',
];

class EatingData {
  EatingData({required this.choice});
  final int choice;
}
