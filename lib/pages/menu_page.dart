import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () => Navigator.pop(context), // Back or toggle
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuButton(context, 'All Events', '/all_events'),
            const SizedBox(height: 16),
            _buildMenuButton(context, 'Notifications', '/notifications'),
            const SizedBox(height: 16),
            _buildMenuButton(context, 'Schedule', '/schedule'),
            const SizedBox(height: 16),
            _buildMenuButton(context, 'Advising', '/advising'),
            const SizedBox(height: 16),
            _buildMenuButton(context, 'Profile', '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, String routeName) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Pill shape based on mockups
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
