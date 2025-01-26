import 'package:flutter/material.dart';

class Cartitems extends StatelessWidget {
  const Cartitems({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample cart data
    List<Map<String, String>> cartItems = [
      {
        "name": "Product 1",
        "image":
            "assets/images/product1.jpg", // Replace with actual image asset
        "price": "\$100",
        "quantity": "1",
      },
      {
        "name": "Product 2",
        "image":
            "assets/images/product2.jpg", // Replace with actual image asset
        "price": "\$150",
        "quantity": "2",
      },
      {
        "name": "Product 3",
        "image":
            "assets/images/product3.jpg", // Replace with actual image asset
        "price": "\$200",
        "quantity": "1",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Colors.black, // Dark background for the app bar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.blueGrey.shade800, // Dark card background
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItems[index]["image"]!, // Load product image
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  cartItems[index]["name"]!,
                  style: const TextStyle(
                    color: Colors.white, // Text color white for contrast
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "Price: ${cartItems[index]["price"]!}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Qty: ${cartItems[index]["quantity"]!}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Handle item removal
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \$450", // You can calculate total dynamically
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle checkout action
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
