import 'package:flutter/material.dart';

class Wedding extends StatelessWidget {
  const Wedding({super.key});

  static const String id = "Wedding";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenHeight * 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/pool.jpg'), // Update image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.2,
                  child: Column(
                    children: [
                      Text(
                        'Pearl Princess',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.07,
                          fontFamily: 'Righteous',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'WEDDINGS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.12,
                          fontFamily: 'Righteous',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Pearl Princess Events offers personalized proposals, inspiration boards, floor plans, lighting, and seating charts. '
                      'They handle the entire wedding preparation process, ensuring a seamless and memorable experience. '
                      'Their staff is dedicated to making your special day unforgettable.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Josefin Slab',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),

            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WEDDING SERVICES',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'K2D',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '• Ceremony & Reception Coordination\n'
                    '• Rehearsal Dinner Coordination\n'
                    '• Rentals & Vendor Coordination\n'
                    '• Wedding Day Timeline\n'
                    '• Floor Plan Design\n'
                    '• Wedding Concept & Design\n'
                    '• Budget Management\n'
                    '• Security & Staffing\n'
                    '• Tenting\n'
                    '• Transportation & Parking',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontFamily: 'Lateef',
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text(
                    'Returned to Reality',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontFamily: 'Lateef',
                    ),
                  ),
                  Text(
                    'By Pearl Princess',
                    style: TextStyle(
                      fontSize: screenWidth * 0.12,
                      fontFamily: 'Lateef',
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCoupleCard(
                    'Dulaj + Rasika | Asian Wedding',
                    'lib/assets/images/pool.jpg',
                    screenWidth,
                  ),
                  _buildCoupleCard(
                    'Sasiruwan + Nethmi | Western Wedding',
                    'lib/assets/images/pool.jpg',
                    screenWidth,
                  ),
                  _buildCoupleCard(
                    'Loshitha + Buddhi | Indian Wedding',
                    'assets/Loshitha_Budhdhi.jpg',
                    screenWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoupleCard(String name, String imagePath, double screenWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: screenWidth * 0.9, // Responsive image width
              height: screenWidth * 0.4, // Responsive height
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: screenWidth * 0.045, // Responsive text size
              color: const Color(0xFF761313),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
