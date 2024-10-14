import 'package:flutter/material.dart';

import 'vendors.dart';
import 'cart.dart';
import 'profile.dart';
import 'event.dart';
import 'wedding.dart';

class Home extends StatefulWidget {
  final VoidCallback toggleTheme;

  const Home({Key? key, required this.toggleTheme}) : super(key: key);

  static const String id = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Vendors(),
    Cart(),
    Profile(),
  ];

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) _searchController.clear();
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Search...'),
        )
            : const Text('Pearl Princess'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.clear : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.sell_rounded), label: 'Vendors'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            height: isPortrait ? screenHeight * 0.20 : screenHeight * 0.15,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('lib/assets/images/dj.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Join With Us, \nSave Your Time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text('We Planned', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(height: 10),
          Container(
            height: isPortrait ? screenHeight * 0.20 : screenHeight * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Wedding()), // Navigate to Wedding page
                    );
                  },
                  child: CategoryCard('lib/assets/images/wedding.jpg', 'Weddings', screenWidth),
                ),
                CategoryCard('lib/assets/images/aluthkalawak.jpg', 'Concerts', screenWidth),
                CategoryCard('lib/assets/images/service.jpg', 'Social Gathering', screenWidth),
                CategoryCard('lib/assets/images/copoeve.jpg', 'Corporate Events', screenWidth),
                CategoryCard('lib/assets/images/workshop.jpg', 'Workshops', screenWidth),
              ],
            ),
          ),

          buildEventCard(context, 'lib/assets/images/guitor.jpg', 'Memories of 20\'s', 'LKR 2500.00', isPortrait),
          buildEventCard(context, 'lib/assets/images/dancer.jpg', 'Sl 2 World', 'LKR 2000.00', isPortrait),
          buildEventCard(context, 'lib/assets/images/pool.jpg', 'Saturday Dj Night', 'LKR 1500.00', isPortrait),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('For You', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text('See More', style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: isPortrait ? screenHeight * 0.20 : screenHeight * 0.30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryCard('lib/assets/images/dress.jpg', 'Costumes', screenWidth),
                CategoryCard('lib/assets/images/dia.jpg', 'Jewelry', screenWidth),
                CategoryCard('lib/assets/images/cakes.jpg', 'Cakes', screenWidth),
              ],
            ),
          ),

          buildContactSection(),
          buildSubscribeSection(),
        ],
      ),
    );
  }

  Widget buildEventCard(BuildContext context, String imagePath, String title, String price, bool isPortrait) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Event(), // Navigate to Event page
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        height: isPortrait ? 200 : 150, // Adjust height based on orientation
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
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
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Need assistance with your event planning?',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubscribeSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Stay updated with our latest news and offers!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double width;

  const CategoryCard(this.imagePath, this.title, this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.black54,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
