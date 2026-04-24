import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.school, color: Colors.black),
        ),
        title: const Text('BRACU ASSIST'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Avatar card placeholder
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
              ),
              child: const Icon(
                Icons.person,
                size: 150,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              '10000xxxxx',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const Text(
              'john.doe@g.bracu.ac.bd',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const Spacer(),
            // Grid of info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('Department', 'CSE'),
                _buildInfoCard('Semester', '4th'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('CGPA', '3.33'),
                _buildInfoCard('Credits', '43'),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.black,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          width: 120,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
