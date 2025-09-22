import 'package:flutter/material.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Classroom',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[50],
        elevation: 0,
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildClassHeader(),
            const SizedBox(height: 30),
            const Text(
              'Students',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            _buildStudentCard(
              name: 'Akhil',
              id: '12345',
              cardColor: const Color(0xFF68C6A1),
              avatarColor: const Color(0xFFB3E0CE),
              isPresent: true,
              isDark: true,
            ),
            _buildStudentCard(
              name: 'Akhil',
              id: '12345',
              cardColor: Colors.white,
              avatarColor: Colors.grey.shade200,
              isPresent: false,
            ),
            _buildStudentCard(
              name: 'Ram',
              id: '12346',
              cardColor: const Color(0xFFF2B5B3),
              avatarColor: const Color(0xFFF9D9D8),
              isPresent: false,
              isDark: true,
            ),
            _buildStudentCard(
              name: 'Sai',
              id: '12346',
              cardColor: const Color(0xFF4A4A6A),
              avatarColor: const Color(0xFF71718F),
              isPresent: true,
              isDark: true,
            ),
            _buildStudentCard(
              name: 'Sai',
              id: '12347',
              cardColor: Colors.white,
              avatarColor: Colors.grey.shade200,
              isPresent: false,
            ),
            _buildStudentCard(
              name: 'Sai',
              id: '12347',
              cardColor: Colors.white,
              avatarColor: Colors.grey.shade200,
              isPresent: false,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// Class header card with subtle shadow
  Widget _buildClassHeader() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4A4A6A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFF71718F),
          child: const Icon(Icons.group, color: Colors.white, size: 28),
        ),
        title: const Text(
          'Class 9-A',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFF71718F),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  /// Modern professional student card
  Widget _buildStudentCard({
    required String name,
    required String id,
    required Color cardColor,
    required Color avatarColor,
    required bool isPresent,
    bool isDark = false,
  }) {
    final Color textColor = isDark ? Colors.white : Colors.black87;
    final Color iconColor = isDark ? Colors.white : Colors.black54;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: avatarColor,
          child: Text(
            name[0].toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black54),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
        ),
        subtitle: Text(
          'ID: $id',
          style: TextStyle(color: textColor.withOpacity(0.7)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPresent ? Icons.check_circle : Icons.circle_outlined,
              color: isPresent
                  ? Colors.green
                  : iconColor.withOpacity(0.7),
              size: 28,
            ),
            const SizedBox(width: 12),
            Icon(Icons.delete_outline,
                color: iconColor.withOpacity(0.7), size: 24),
          ],
        ),
      ),
    );
  }
}
