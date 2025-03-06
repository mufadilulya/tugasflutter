import 'package:flutter/material.dart';
import 'package:pos/presentation/models/ticket.dart';

class Ticket {
  final String name;
  final String category;
  final int price;
  int quantity;

  Ticket({
    required this.name,
    required this.category,
    required this.price,
    this.quantity = 0,
  });
}

// providers/ticket_provider.dart

class TicketProvider with ChangeNotifier {
  final List<Ticket> _tickets = [
    Ticket(name: "Tiket Masuk Dewasa", category: "Nusantara", price: 50000),
    Ticket(name: "Tiket Masuk Anak", category: "Nusantara", price: 20000),
    Ticket(name: "Tiket Masuk Dewasa", category: "Mancanegara", price: 150000),
    Ticket(name: "Tiket Masuk Anak", category: "Mancanegara", price: 40000),
  ];

  List<Ticket> get tickets => _tickets;

  void increaseQuantity(int index) {
    _tickets[index].quantity++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_tickets[index].quantity > 0) {
      _tickets[index].quantity--;
      notifyListeners();
    }
  }

  int get totalPrice =>
      _tickets.fold(0, (sum, item) => sum + (item.quantity * item.price));
}
