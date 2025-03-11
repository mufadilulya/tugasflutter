import 'package:flutter/material.dart';
import 'package:pos/models/ticket.dart';
import 'package:pos/components/ticket_card.dart';
import 'package:pos/presentation/screens/orderdetail_screen.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  List<Ticket> tickets = [
    Ticket(title: "Tiket Masuk Dewasa", category: "Nusantara", price: 50000),
    Ticket(title: "Tiket Masuk Anak", category: "Nusantara", price: 20000),
    Ticket(title: "Tiket Masuk Dewasa", category: "Mancanegara", price: 150000),
    Ticket(title: "Tiket Masuk Anak", category: "Mancanegara", price: 40000),
  ];

  // Menghasilkan orderItems berdasarkan tiket yang dipilih (quantity > 0)
  List<Map<String, dynamic>> get orderItems {
    return tickets
        .where((ticket) => ticket.quantity > 0)
        .map(
          (ticket) => {
            'name': ticket.title,
            'description': ticket.category,
            'price': ticket.price,
            'quantity': ticket.quantity,
          },
        )
        .toList();
  }

  // Menghitung total harga dari semua tiket yang dipilih
  int get totalPrice =>
      tickets.fold(0, (sum, ticket) => sum + (ticket.price * ticket.quantity));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Penjualan Tiket")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return TicketCard(
                  ticket: tickets[index],
                  onIncrement: () {
                    setState(() {
                      tickets[index].quantity++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (tickets[index].quantity > 0) {
                        tickets[index].quantity--;
                      }
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. $totalPrice",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (orderItems.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => OrderDetailScreen(
                                  orderItems: orderItems,
                                  totalPrice: totalPrice,
                                ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tidak ada tiket yang dipilih.'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Process"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
