import 'package:flutter/material.dart';
import 'package:ppe/profile.dart';
import 'costume.dart';
import 'home.dart';
import 'cart.dart';
import 'horizon.dart';
import 'photographer.dart';

class Vendors extends StatefulWidget {
  const Vendors({super.key});

  static const String id = "Vendors";

  @override
  _VendorsState createState() => _VendorsState();
}

class _VendorsState extends State<Vendors> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Home.id);
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Cart.id);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Profile.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          final double screenHeight = MediaQuery.of(context).size.height;
          final double screenWidth = MediaQuery.of(context).size.width;
          final bool isLandscape = orientation == Orientation.landscape;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFF1E2A5E),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryIcon('lib/assets/images/horizanimg.jpg', 'Jewelry', isLandscape: isLandscape),
                        CategoryIcon('lib/assets/images/66f2fb4bf0f12-DoubleBreasted5piecessuit.jpg', 'Costumes', isLandscape: isLandscape),
                        CategoryIcon('lib/assets/images/camera.jpg', 'Imaging', isLandscape: isLandscape),
                        CategoryIcon('lib/assets/images/vanue.jpg', 'Venues', isLandscape: isLandscape),
                      ],
                    ),
                  ),
                ),

                VendorCategory(
                  categoryTitle: 'Jewelry',
                  vendorImages: [
                    VendorItem('lib/assets/images/bracelet.jpg', 'Bracelet', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/BroadBangle.jpg', 'Broad Bangle', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/horizanimg.jpg', 'Horizon Ring', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/LockBangle.png', 'Lock Bangle', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/BridalNecklace.png', 'Bridal Necklace', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/tinyheart.jpg', 'Tiny Heart', isLandscape: isLandscape),
                  ],
                ),

                VendorCategory(
                  categoryTitle: 'Costumes',
                  vendorImages: [
                    VendorItem('lib/assets/images/66f2fb4bf0f12-DoubleBreasted5piecessuit.jpg', 'DB Suit', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/SingleBreasted4PiecesSuit4.jpg', 'SB Suit', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/EnchantressWeddingDress2.jpg', 'Enchantress...', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/StrychineCutWeddingDress3.jpg', 'Strychnine...', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/HighNeckRollingCollar5piecessuit2.jpg', 'High Neck Suit', isLandscape: isLandscape),
                  ],
                ),

                _buildPhotographySection(screenHeight, screenWidth, isLandscape),

                VendorCategory(
                  categoryTitle: 'Floras',
                  vendorImages: [
                    VendorItem('lib/assets/images/akalanka.jpg', 'Alankara Flora', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/lassana.jpg', 'Lassan Flora', isLandscape: isLandscape),
                    VendorItem('lib/assets/images/goldern.jpg', 'Golden Flora', isLandscape: isLandscape),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    color: const Color(0xFFF2F1F7),
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Catering',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E2A5E),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Menu', style: TextStyle(fontSize: 16, color: Colors.blue)),
                            ),
                            const SizedBox(width: 18),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Book', style: TextStyle(fontSize: 16, color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhotographySection(double screenHeight, double screenWidth, bool isLandscape) {
    if (isLandscape) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Photographer()));
              },
              child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/piyumal.jpg', 'Piyumal Sachintha Photography', isLandscape),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Handle tap
              },
              child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/nadun.jpg', 'Nadun Lakmina Photography', isLandscape),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Photographer()));
              },
              child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/lahiru.jpg', 'Lahiru Theekshana Photography', isLandscape),
            ),
          ),
        ],
      );
    } else {
      // Portrait mode: show as a column
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Photographer()));
            },
            child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/piyumal.jpg', 'Piyumal Sachintha Photography', isLandscape),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/nadun.jpg', 'Nadun Lakmina Photography', isLandscape),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: _buildPhotographyContainer(screenHeight, screenWidth, 'lib/assets/images/lahiru.jpg', 'Lahiru Theekshana Photography', isLandscape),
          ),
        ],
      );
    }
  }

















  Widget _buildPhotographyContainer(double screenHeight, double screenWidth, String imagePath, String name, bool isLandscape) {
    final double containerHeight = isLandscape ? screenHeight * 0.35 : screenHeight * 0.20;
    final double containerWidth = isLandscape ? screenWidth * 0.5 : screenWidth * 0.9;

    return Container(
      margin: const EdgeInsets.all(16.0),
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isLandscape;

  const CategoryIcon(this.iconPath, this.label, {this.isLandscape = false});

  @override
  Widget build(BuildContext context) {
    final double iconSize = isLandscape ? 64 : 32;
    final double fontSize = isLandscape ? 18 : 16;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: iconSize,
            backgroundImage: AssetImage(iconPath),
          ),
          const SizedBox(height: 10),
          Text(label, style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ],
      ),
    );
  }
}

class VendorCategory extends StatelessWidget {
  final String categoryTitle;
  final List<VendorItem> vendorImages;

  const VendorCategory({required this.categoryTitle, required this.vendorImages});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: isDarkMode ? Colors.white : const Color(0xFF1E2A5E),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: vendorImages,
            ),
          ),
        ],
      ),
    );
  }
}

class VendorItem extends StatelessWidget {
  final String imagePath;
  final String vendorName;
  final bool isLandscape;

  const VendorItem(this.imagePath, this.vendorName, {this.isLandscape = false});

  @override
  Widget build(BuildContext context) {
    final double imageSize = isLandscape ? 140 : 100;
    final double fontSize = isLandscape ? 20 : 18;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: InkWell(
        onTap: () {
          if (vendorName == 'Horizon Ring') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MysticBlueHorizon()),
            );
          } else if (vendorName == 'DB Suit') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DoubleBreastedSuit()),
            );
          }
        },
        child: Column(
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              vendorName,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
