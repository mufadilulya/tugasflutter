import 'package:flutter/material.dart';
import 'package:pos/presentation/screens/payment_success_screen.dart';
import 'package:provider/provider.dart';
import 'package:pos/providers/ticket_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);
    int totalPrice = ticketProvider.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black), // Tombol back hitam
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ringkasan Pembelian",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Menampilkan daftar tiket yang dibeli
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
                            trailing: Text(
                              "${ticketProvider.ticketCounts[ticket.id]} x Rp. ${ticket.price}",
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
                  "Rp. $totalPrice",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Pilihan Metode Pembayaran
            Text(
              "Pilih Metode Pembayaran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            PaymentMethod(),

            const SizedBox(height: 20),

            // Tombol Bayar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  "Bayar Sekarang",
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

// Widget untuk Pilihan Metode Pembayaran
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String selectedMethod = "Bank Transfer"; // Default metode pembayaran

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text("Bank Transfer"),
          value: "Bank Transfer",
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("E-Wallet (Gopay, OVO, Dana)"),
          value: "E-Wallet",
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text("Kartu Kredit"),
          value: "Kartu Kredit",
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value.toString();
            });
          },
        ),
      ],
    );
  }
}
