import 'package:flutter/material.dart';

class Photographer extends StatelessWidget {
  const Photographer({super.key});

  static const String id = "Photographer";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Photographer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        backgroundColor: const Color(0xFF1E2A5E),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: screenWidth * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section with Full Width Image Background and Curved Corners
                Container(
                  width: double.infinity,
                  height: screenWidth * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)), // Curved bottom corners
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/piyumal.jpg', // Updated image name
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: screenWidth * 0.5,
                        ),
                        Container(
                          color: Colors.black54,
                          height: screenWidth * 0.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Piyumal Sachintha Photography',
                              style: TextStyle(
                                fontSize: screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Capturing Moments, Creating Memories',
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Portfolio Section
                Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildPortfolioGrid(), // Build portfolio grid here
                const SizedBox(height: 20),

                // Services Section with Icons and Enhanced Design
                Text(
                  'Services Offered',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[850] // Dark mode background
                        : Colors.blueGrey[50], // Light mode background
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      _ServiceItem(icon: Icons.photo_camera, text: 'Wedding Photography'),
                      _ServiceItem(icon: Icons.portrait, text: 'Portrait Photography'),
                      _ServiceItem(icon: Icons.event, text: 'Event Coverage'),
                      _ServiceItem(icon: Icons.business, text: 'Corporate Events'),
                      _ServiceItem(icon: Icons.edit, text: 'Photo Editing'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Contact Section with Enhanced Design
                Text(
                  'Contact Me',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[850] // Dark mode background
                        : Colors.blueGrey[50], // Light mode background
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: johndoe@example.com'),
                      Text('Phone: +123 456 7890'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper to build the portfolio grid
  Widget _buildPortfolioGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildPortfolioImage('lib/assets/images/girl.jpg'),
        _buildPortfolioImage('lib/assets/images/family.jpg'),
        _buildPortfolioImage('lib/assets/images/double.jpg'),
        _buildPortfolioImage('lib/assets/images/event.jpg'),
      ],
    );
  }

  // Helper to build portfolio images
  Widget _buildPortfolioImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero( // Add Hero widget for animation
          tag: imagePath,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Optionally, navigate to a detailed view of the image
              },
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget for service items with icons
class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ServiceItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1E2A5E), size: 24), // Icon color and size
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
