import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  static const String id = "Event";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).scaffoldBackgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Event Image
                  Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/guitor.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    width: screenWidth * 0.85,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Memories Of 20\'s',
                          style: TextStyle(
                            fontSize: screenWidth * 0.08,
                            fontWeight: FontWeight.bold,
                            color: isDarkTheme
                                ? Colors.white // Dark theme font color
                                : Theme.of(context)
                                    .colorScheme
                                    .secondary, // Light theme font color
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 15),
                        _buildEventInfo(
                          context,
                          icon: Icons.music_note_rounded,
                          text: 'Music By News',
                        ),
                        _buildEventInfo(
                          context,
                          icon: Icons.calendar_today_rounded,
                          text: '05/10/2024',
                        ),
                        _buildEventInfo(
                          context,
                          icon: Icons.access_time_filled_rounded,
                          text: '19:30 PM - 23:30 PM',
                        ),
                        _buildEventInfo(
                          context,
                          icon: Icons.location_pin,
                          text: 'Lotus Tower Outdoor',
                        ),
                        _buildEventInfo(
                          context,
                          icon: Icons.people,
                          text:
                              'BNS, Samitha, Athula, Sureni, Romesh, La Sinore',
                        ),
                        _buildEventInfo(
                          context,
                          icon: Icons.credit_card,
                          text: 'Online Tickets Only',
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Get Tickets',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
        ],
      ),
    );
  }

  // Helper Widget to Build Event Info Items
  Widget _buildEventInfo(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isDarkTheme
                ? Colors.white
                : Theme.of(context).colorScheme.secondary,
            size: 30,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isDarkTheme ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
