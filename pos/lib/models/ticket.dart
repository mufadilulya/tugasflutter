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

// List<Ticket> tickets = [
//   Ticket(title: 'Ticket 1', category: 'Category 1', price: 100),
//   Ticket(title: 'Ticket 2', category: 'Category 2', price: 200),
//   Ticket(title: 'Ticket 3', category: 'Category 3', price: 300),
//   Ticket(title: 'Ticket 4', category: 'Category 4', price: 400),
//   Ticket(title: 'Ticket 5', category: 'Category 5', price: 500),
// ];
