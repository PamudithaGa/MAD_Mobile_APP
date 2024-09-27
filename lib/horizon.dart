import 'package:flutter/material.dart';

class MysticBlueHorizon extends StatelessWidget {
  const MysticBlueHorizon({super.key});

  static const String id = "MysticBlueHorizon";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text('Mystic Blue Horizon Ring'),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            child: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? _buildPortraitLayout(screenWidth, isDarkMode)
                    : _buildLandscapeLayout(screenWidth, isDarkMode);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(double screenWidth, bool isDarkMode) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            child: Image.asset(
              'lib/assets/images/horizanimg.jpg',
              fit: BoxFit.cover,
              height: screenWidth * 0.5, // Maintain aspect ratio
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildDetailsSection(screenWidth, isDarkMode),
      ],
    );
  }

  Widget _buildLandscapeLayout(double screenWidth, bool isDarkMode) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'lib/assets/images/horizanimg.jpg',
                fit: BoxFit.cover,
                height: screenWidth * 0.3, // Minimized height
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: _buildDetailsSection(screenWidth, isDarkMode),
        ),
      ],
    );
  }

  Widget _buildDetailsSection(double screenWidth, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mystic Blue Horizon Ring',
            style: TextStyle(
              fontSize: screenWidth * 0.06, // Adjusted font size
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Rs.99,000',
            style: TextStyle(
              fontSize: screenWidth * 0.06, // Adjusted font size
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 20),
          _buildDetailsTable(isDarkMode),
          Center(
            child: ElevatedButton(
              onPressed: () {
                BuildContext context;
                Navigator.push(
                  BuildContext as BuildContext,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3A4664),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    );
  }

  Widget _buildDetailsTable(bool isDarkMode) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Feature')),
        DataColumn(label: Text('Details')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('Gold Standard')),
          DataCell(Text('18KT Gold')),
        ]),
        DataRow(cells: [
          DataCell(Text('Weight')),
          DataCell(Text('1.32 grams')),
        ]),
        DataRow(cells: [
          DataCell(Text('Stone Type')),
          DataCell(Text('Sapphire | Diamonds')),
        ]),
        DataRow(cells: [
          DataCell(Text('Diamond Weight')),
          DataCell(Text('0.03ct')),
        ]),
        DataRow(cells: [
          DataCell(Text('Stone Weight')),
          DataCell(Text('0.26ct')),
        ]),
        DataRow(cells: [
          DataCell(Text('Size')),
          DataCell(Text('Ring size: 14 (U: 54)')),
        ]),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('This is the Home Page')),
    );
  }
}
