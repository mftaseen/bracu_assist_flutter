import 'package:flutter/material.dart';

class PastEventsPage extends StatelessWidget {
  const PastEventsPage({super.key});

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
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Text(
              'Past Events',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'JockeyOne',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildLargeEventCard(context, 'A Festival', 'Brac University A Club', false),
                const SizedBox(height: 16),
                _buildLargeEventCard(context, 'B Festival', 'Brac University B Club', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeEventCard(BuildContext context, String title, String club, bool isUpcoming) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 8),
            ),
            child: const Icon(Icons.image, size: 80, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Text('March', style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text('19', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'JockeyOne',
                      ),
                    ),
                    Text(
                      club,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context, 
                    '/event_details', 
                    arguments: {'title': title, 'club': club, 'isUpcoming': isUpcoming},
                  );
                },
                icon: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 36),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
