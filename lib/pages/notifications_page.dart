import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.black,
            alignment: Alignment.center,
            child: const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                _buildNotificationCard(
                  'CSE111-12-9C15C',
                  'Assignment 7 submission due tomorrow',
                ),
                const SizedBox(height: 16),
                _buildNotificationCard(
                  'CSE111-12-9C15C',
                  'Quiz 3 scheduled on March 20, 2026 on Tracing',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(String course, String detail) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            alignment: Alignment.center,
            child: Text(
              course,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              detail,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
