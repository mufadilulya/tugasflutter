import 'package:flutter/material.dart';
import 'qrispayment_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orderItems;
  final int totalPrice;

  const OrderDetailScreen({
    super.key,
    required this.orderItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Pesanan',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) {
                  final item = orderItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(item['description']),
                              Text(
                                'Rp. ${item['price'].toString()} x ${item['quantity']}',
                              ),
                            ],
                          ),
                          Text(
                            'Rp. ${(item['price'] * item['quantity']).toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PaymentMethodButton(
                  icon: Icons.qr_code,
                  label: 'QRIS',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => QrisPaymentScreen(
                              amount: totalPrice,
                              totalPrice: totalPrice,
                            ),
                      ),
                    );
                  },
                ),
                PaymentMethodButton(
                  icon: Icons.money,
                  label: 'Tunai',
                  onTap: () {},
                ),
                PaymentMethodButton(
                  icon: Icons.credit_card,
                  label: 'Transfer',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp. $totalPrice',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Process'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PaymentMethodButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      child: Column(
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
