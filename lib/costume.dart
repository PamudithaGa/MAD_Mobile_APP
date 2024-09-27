import 'package:flutter/material.dart';
import 'home.dart';

class DoubleBreastedSuit extends StatelessWidget {
  const DoubleBreastedSuit({super.key});

  static const String id = "DoubleBreastedSuit";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final isLandscape = orientation == Orientation.landscape;
        final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

        // Adjust dimensions based on orientation
        final double imageHeight = isLandscape ? screenHeight * 0.45 : screenHeight * 0.35;
        final double imageWidth = isLandscape ? screenWidth * 0.9 : double.infinity;
        final double paddingSize = isLandscape ? 24 : 16;
        final double titleFontSize = isLandscape ? screenWidth * 0.05 : screenWidth * 0.065;
        final double descriptionFontSize = isLandscape ? screenWidth * 0.035 : screenWidth * 0.04;
        final double priceFontSize = isLandscape ? screenWidth * 0.045 : screenWidth * 0.05;

        return Scaffold(
          backgroundColor: isDarkTheme ? const Color(0xFF121212) : const Color(0xFFFAFAFA),
          appBar: AppBar(
            title: const Text('Suit Details'), // App bar title
            backgroundColor: isDarkTheme ? const Color(0xFF1E2A5E) : const Color(0xFF1E2A5E),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth * (isLandscape ? 0.75 : 0.85),
                decoration: BoxDecoration(
                  color: isDarkTheme ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'lib/assets/images/DoubleBreasted5piecessuit.jpg',
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Title and Description Section
                    Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Double Breasted 5 Pieces Suit',
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: isDarkTheme ? Colors.white : const Color(0xFF1E2A5E),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'This feature suit is the first in the NB 2016/17 grooms collection with sharp detail given to the navy jacket to blend well with a gray waistcoat to give the feel of a true gentleman of the court. The suit features a double breasted single button and comes as a 5 piece suit including the waistcoat and tie. Made with 100 percent Italian wool.',
                            style: TextStyle(
                              fontSize: descriptionFontSize,
                              height: 1.5,
                              color: isDarkTheme ? Colors.white70 : Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20),


                          Text(
                            'Price: Rs. 99,000',
                            style: TextStyle(
                              fontSize: priceFontSize,
                              fontWeight: FontWeight.bold,
                              color: isDarkTheme ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Button Section
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E2A5E),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Own Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
