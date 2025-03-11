class Ticket {
  final String title;
  final String category;
  final int price;
  int quantity;

  Ticket({
    required this.title,
    required this.category,
    required this.price,
    this.quantity = 0,
  });
}
