import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String id = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return ListView(
              children: [
                // Profile Picture and Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pamuditha Gangana",
                          style: TextStyle(
                            fontSize: orientation == Orientation.landscape ? 28 : 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Theme.of(context).primaryColor),
                            Text(
                              "5.0",
                              style: TextStyle(color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: const AssetImage('lib/assets/images/pamu.jpg'),
                      radius: orientation == Orientation.landscape ? 40 : 30,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Personal Information
                const Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildInfoRow('Email:', 'pamu000@gmail.com', orientation),
                _buildInfoRow('Phone:', '+94722644385', orientation),
                _buildInfoRow('Address:', 'Padiwela, Padiwela, Sri Lanka', orientation),
                const SizedBox(height: 20),

                // Order History
                const Text(
                  'Order History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildOrderHistoryItem('Order #1234', 'Placed on: 2024-08-26', '\LKR 75,000.00', orientation),
                _buildOrderHistoryItem('Order #1235', 'Placed on: 2024-09-17', '\LKR 68,000.00', orientation),
                const SizedBox(height: 20),

                // Payment Methods
                const Text(
                  'Payment Methods',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildPaymentMethod('Visa **** **** **** 2538', orientation),
                _buildPaymentMethod('Visa: pamu000@gmail.com', orientation),
                const SizedBox(height: 20),

                // Account Settings
                const Text(
                  'Account Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to change password page
                  },
                  child: const Text('Change Password'),
                ),

                // Logout Button
                ElevatedButton(
                  onPressed: () {
                    // Implement logout functionality
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, Orientation orientation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: orientation == Orientation.landscape ? 18 : 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: orientation == Orientation.landscape ? 18 : 16),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistoryItem(String title, String date, String amount, Orientation orientation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: orientation == Orientation.landscape ? 18 : 16)),
        subtitle: Text(date, style: TextStyle(fontSize: orientation == Orientation.landscape ? 16 : 14)),
        trailing: Text(amount, style: TextStyle(fontSize: orientation == Orientation.landscape ? 16 : 14)),
      ),
    );
  }

  Widget _buildPaymentMethod(String method, Orientation orientation) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        title: Text(method, style: TextStyle(fontSize: orientation == Orientation.landscape ? 18 : 16)),
        onTap: () {
          // Navigate to edit payment method
        },
      ),
    );
  }
}
