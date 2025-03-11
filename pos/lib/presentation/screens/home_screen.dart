import 'package:flutter/material.dart';
import 'package:pos/components/appcolors.dart';
import 'package:pos/components/ticket_card.dart';
import 'package:pos/models/ticket.dart';
import 'package:pos/presentation/screens/orderdetail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Penjualan Tiket", style: TextStyle(color: AppColor.first)),
      ),
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp. $totalPrice",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.first,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
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
                      backgroundColor: AppColor.first,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 52.0,
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
