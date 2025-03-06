import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pos/providers/ticket_provider.dart';
import 'package:pos/presentation/screens/checkout_screen.dart';

class TicketOrderScreen extends StatelessWidget {
  const TicketOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiket Saya", style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ringkasan Pesanan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children:
                    ticketProvider.tickets
                        .where(
                          (ticket) =>
                              ticketProvider.ticketCounts[ticket.id]! > 0,
                        )
                        .map(
                          (ticket) => ListTile(
                            title: Text(ticket.name),
                            subtitle: Text(ticket.category),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${ticketProvider.ticketCounts[ticket.id]} x Rp. ${ticket.price}",
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    ticketProvider.removeTicket(ticket.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),

            Divider(),

            // Total Harga
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bayar:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. ${ticketProvider.getTotalPrice()}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol Lanjut ke Checkout
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  "Lanjut ke Pembayaran",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
