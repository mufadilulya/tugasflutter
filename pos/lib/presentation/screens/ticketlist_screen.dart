import 'package:flutter/material.dart';
import 'package:pos/models/ticket.dart';
import 'package:pos/components/ticket_card.dart';

class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  List<Ticket> tickets = [
    Ticket(title: "Tiket Masuk Dewasa", category: "Nusantara", price: 50000),
    Ticket(title: "Tiket Masuk Anak", category: "Nusantara", price: 20000),
    Ticket(title: "Tiket Masuk Dewasa", category: "Mancanegara", price: 150000),
    Ticket(title: "Tiket Masuk Anak", category: "Mancanegara", price: 40000),
  ];

  int getTotalPrice() {
    return tickets.fold(
      0,
      (sum, ticket) => sum + (ticket.price * ticket.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penjualan Tiket")),
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
                Text(
                  "Order Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. ${getTotalPrice()}",
                  style: TextStyle(
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
                      // Implementasi checkout
                    },
                    child: Text("Process"),
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
