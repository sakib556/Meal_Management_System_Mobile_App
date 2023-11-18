class GlobalCarItemModel {
  final String iconPath;
  final String title;
  final String type;
  final String price;
  final int quantity;
  final bool isSelected;
  final Function() onSelectionChange;
  final Function(int quantity) onQuantityChange;

  const GlobalCarItemModel({
    required this.iconPath,
    required this.title,
    required this.type,
    required this.price,
    required this.quantity,
    required this.isSelected,
    required this.onSelectionChange,
    required this.onQuantityChange
  });
}
