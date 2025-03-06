import 'package:flutter/material.dart';

class TicketProvider extends ChangeNotifier {
  final List<Ticket> tickets = [
    Ticket(
      id: 1,
      name: "Tiket Masuk Dewasa",
      category: "Nusantara",
      price: 50000,
    ),
    Ticket(
      id: 2,
      name: "Tiket Masuk Anak",
      category: "Nusantara",
      price: 20000,
    ),
    Ticket(
      id: 3,
      name: "Tiket Masuk Dewasa",
      category: "Mancanegara",
      price: 150000,
    ),
    Ticket(
      id: 4,
      name: "Tiket Masuk Anak",
      category: "Mancanegara",
      price: 40000,
    ),
  ];

  Map<int, int> ticketCounts = {}; // Menyimpan jumlah tiket yang dipilih

  TicketProvider() {
    // Inisialisasi semua tiket dengan jumlah 0
    for (var ticket in tickets) {
      ticketCounts[ticket.id] = 0;
    }
  }

  // Menambahkan jumlah tiket
  void increment(int id) {
    ticketCounts[id] = (ticketCounts[id] ?? 0) + 1;
    notifyListeners();
  }

  // Mengurangi jumlah tiket (tidak boleh kurang dari 0)
  void decrement(int id) {
    if (ticketCounts[id]! > 0) {
      ticketCounts[id] = ticketCounts[id]! - 1;
      notifyListeners();
    }
  }

  // Menghapus tiket dari pesanan
  void removeTicket(int ticketId) {
    if (ticketCounts.containsKey(ticketId)) {
      ticketCounts[ticketId] = 0;
      notifyListeners();
    }
  }

  // Mendapatkan total harga tiket yang dipesan
  int getTotalPrice() {
    int total = 0;
    for (var ticket in tickets) {
      total += (ticketCounts[ticket.id]! * ticket.price);
    }
    return total;
  }
}

// Model Ticket
class Ticket {
  final int id;
  final String name;
  final String category;
  final int price;

  Ticket({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });
}
