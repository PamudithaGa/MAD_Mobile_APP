import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  static const String id = "Cart"; // Route name

  final List<CartItem> cartItems = const [
    CartItem(image: 'lib/assets/images/guitor.jpg', title: 'Memories of 20\'s', price: 2500.00),
    CartItem(image: 'lib/assets/images/dia.jpg', title: 'Jewelry', price: 69000.00),
    CartItem(image: 'lib/assets/images/DoubleBreasted5piecessuit.jpg', title: 'Double Breasted 5 Pieces Suit', price: 120000.00),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        cartItem: cartItems[index],
                        onRemove: () {
                          // Implement item removal logic here
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildPriceRow('Subtotal:', totalPrice, orientation),
                  const SizedBox(height: 10),
                  _buildPromoCodeRow(orientation),
                  const SizedBox(height: 10),
                  _buildPriceRow('Total Amount:', totalPrice, orientation, isTotal: true),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement checkout logic here
                    },
                    child: const Text('Checkout'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPriceRow(String title, double amount, Orientation orientation, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          '\LKR ${amount.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _buildPromoCodeRow(Orientation orientation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Promo Code:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 30,
          width: orientation == Orientation.landscape ? 200 : 100, // Adjust the width for landscape
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Enter Promo',
            ),
            onChanged: (value) {
              // Handle promo code input logic here
            },
          ),
        ),
      ],
    );
  }
}

class CartItem {
  final String image;
  final String title;
  final double price;

  const CartItem({required this.image, required this.title, required this.price});
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;

  const CartItemWidget({Key? key, required this.cartItem, required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              cartItem.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.title, style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 8),
                  Text('\LKR ${cartItem.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: onRemove,
            ),
          ],
        ),
      ),
    );
  }
}
