import 'package:flutter/material.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  // Example attendance data
  final List<Map<String, dynamic>> attendanceData = const [
    {"date": "2025-09-14", "studentsPresent": 45, "studentsAbsent": 5},
    {"date": "2025-09-15", "studentsPresent": 48, "studentsAbsent": 2},
    {"date": "2025-09-16", "studentsPresent": 50, "studentsAbsent": 0},
    {"date": "2025-09-17", "studentsPresent": 47, "studentsAbsent": 3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mid-Day Meal ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              " Report (Day-by-Day)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceData.length,
                itemBuilder: (context, index) {
                  final data = attendanceData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          data['date'].split("-").last, // Day only
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        "Date: ${data['date']}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "Present: ${data['studentsPresent']}  |  Absent: ${data['studentsAbsent']}"),
                      trailing: const Icon(Icons.food_bank, color: Colors.orange),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
