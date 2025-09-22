import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      "title": "Attendance Captured",
      "message": "Your attendance for today (17 Sep) was successfully marked at 9:15 AM.",
      "type": "success",
      "time": "5 min ago",
    },
    {
      "title": "Camera Access Denied",
      "message": "We couldn't access your camera. Please allow camera permissions and retry.",
      "type": "warning",
      "time": "10 min ago",
    },
    {
      "title": "New Feature",
      "message": "Face recognition has been improved for faster detection!",
      "type": "info",
      "time": "1 hr ago",
    },
    {
      "title": "Attendance Reminder",
      "message": "Don't forget to capture your attendance before 10:00 AM.",
      "type": "reminder",
      "time": "Today, 8:45 AM",
    },
  ];

  Color _getTypeColor(String type) {
    switch (type) {
      case "success":
        return Colors.green;
      case "warning":
        return Colors.orange;
      case "info":
        return Colors.blue;
      case "reminder":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case "success":
        return Icons.check_circle;
      case "warning":
        return Icons.warning_amber_rounded;
      case "info":
        return Icons.info_outline;
      case "reminder":
        return Icons.notifications_active_outlined;
      default:
        return Icons.notifications_none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No notifications yet",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final type = notification["type"] as String;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: _getTypeColor(type).withOpacity(0.1),
                      child: Icon(
                        _getTypeIcon(type),
                        color: _getTypeColor(type),
                        size: 26,
                      ),
                    ),
                    title: Text(
                      notification["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getTypeColor(type),
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification["message"]!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification["time"]!,
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
