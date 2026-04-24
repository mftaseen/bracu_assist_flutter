import 'package:flutter/material.dart';

class AllEventsPage extends StatelessWidget {
  const AllEventsPage({super.key});

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
              'All Events',
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
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildEventSection(
                  context: context,
                  title: 'Upcoming Events',
                  events: [
                    {'title': 'A Festival', 'club': 'Brac University A Club'},
                    {'title': 'B Festival', 'club': 'Brac University B Club'},
                    {'title': 'C Festival', 'club': 'Brac University C Club'},
                  ],
                  onSeeAll: () {
                    Navigator.pushNamed(context, '/upcoming_events');
                  },
                ),
                const SizedBox(height: 24),
                _buildEventSection(
                  context: context,
                  title: 'Past Events',
                  events: [
                    {'title': 'A Festival', 'club': 'Brac University A Club'},
                    {'title': 'B Festival', 'club': 'Brac University B Club'},
                    {'title': 'C Festival', 'club': 'Brac University C Club'},
                  ],
                  onSeeAll: () {
                    Navigator.pushNamed(context, '/past_events');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventSection({
    required BuildContext context,
    required String title,
    required List<Map<String, String>> events,
    required VoidCallback onSeeAll,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return _buildEventCardCard(context, event['title']!, event['club']!);
                },
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: const Size(100, 36),
                ),
                onPressed: onSeeAll,
                child: const Text('See All', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCardCard(BuildContext context, String title, String club) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, size: 60, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'March 19, 2026',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'JockeyOne'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            club,
            style: const TextStyle(fontSize: 9),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
