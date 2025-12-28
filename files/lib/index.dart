import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Credit Card Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Card Number
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // Card Holder Name
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            // Expiry + CVV
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Pay Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Pay Now'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Payment Submitted'),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
