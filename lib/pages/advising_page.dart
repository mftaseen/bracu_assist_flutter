import 'package:flutter/material.dart';

class AdvisingPage extends StatefulWidget {
  const AdvisingPage({super.key});

  @override
  State<AdvisingPage> createState() => _AdvisingPageState();
}

class _AdvisingPageState extends State<AdvisingPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Map<String, dynamic>? _selectedCourse;

  final List<Map<String, dynamic>> _allCourses = [
    {
      'code': 'ARC 101',
      'title': 'Basics of Architecture',
      'credits': '3',
      'prerequisites': 'None',
      'description': 'Description: Lorem ipsum dolor sit amet Lorem ipsum dolor Sit Amet Lorem ipsum Dolor Sit Amet. Lorem ipsum Dolor Sit Amet Lorem ipsum Dolor Sit Amet Lorem ipsum Dolor Sit Amet Lorem ipsum Dolor Sit Amet.',
      'supportingText': 'Supporting line text lorem ipsum dolor sit amet...',
    },
    {
      'code': 'ARC 102',
      'title': 'Advanced Architecture',
      'credits': '3',
      'prerequisites': 'ARC 101',
      'description': 'Description: Advanced topics in architecture.',
      'supportingText': 'Supporting line text lorem ipsum dolor sit amet...',
    },
    {
      'code': 'CSE 111',
      'title': 'Programming Language II',
      'credits': '3',
      'prerequisites': 'CSE 110',
      'description': 'Description: Object oriented programming concepts using Java.',
      'supportingText': 'Supporting line text lorem ipsum dolor sit amet...',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCourses = _allCourses.where((course) {
      return course['code'].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
             course['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

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
              'Advising',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                        _selectedCourse = null; // reset selection on search
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Input Course Code',
                      prefixIcon: const Icon(Icons.arrow_back),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                            _selectedCourse = null;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_searchQuery.isNotEmpty && _selectedCourse == null)
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListView.builder(
                          itemCount: filteredCourses.length,
                          itemBuilder: (context, index) {
                            final course = filteredCourses[index];
                            return ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Colors.purple,
                                child: Text('A', style: TextStyle(color: Colors.white)),
                              ),
                              title: Text(
                                course['code'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(course['supportingText']),
                              onTap: () {
                                setState(() {
                                  _selectedCourse = course;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  if (_selectedCourse != null)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  _selectedCourse!['code'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Course Title: ${_selectedCourse!['title']}\n'
                                'Course Credits: ${_selectedCourse!['credits']}\n'
                                'Prerequisites: ${_selectedCourse!['prerequisites']}\n\n'
                                '${_selectedCourse!['description']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
