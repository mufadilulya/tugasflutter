import 'package:flutter/material.dart';

class QrisPaymentScreen extends StatelessWidget {
  final int totalPrice;

  const QrisPaymentScreen({
    super.key,
    required this.totalPrice,
    required int amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Receipt'),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'PAYMENT RECEIPT',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Image.asset('assets/images/qrispay.png'),
                  const SizedBox(height: 20),
                  const Text('Scan this QR code to verify tickets'),
                  const SizedBox(height: 10),
                  Text('Tagihan        Rp. $totalPrice'),
                  const Divider(),
                  ListTile(
                    title: const Text('Metode Bayar'),
                    trailing: const Text('QRIS'),
                  ),
                  ListTile(
                    title: const Text('Waktu'),
                    trailing: Text(DateTime.now().toString().substring(0, 10)),
                  ),
                  ListTile(
                    title: const Text('Status'),
                    trailing: const Text('Menunggu Pembayaran'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Cetak Transaksi'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.indigo.shade100,
    );
  }
}
