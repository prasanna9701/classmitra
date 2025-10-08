import 'package:flutter/material.dart';

class ClassroomPage extends StatefulWidget {
  const ClassroomPage({super.key});

  @override
  State<ClassroomPage> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends State<ClassroomPage> {
  final TextEditingController _searchController = TextEditingController();

  String _activeFilter = 'All'; // All | Present | Absent

  final List<Map<String, dynamic>> _students = [
    {
      'name': 'Akhil',
      'id': 'S-1001',
      'present': true,
    },
    {
      'name': 'Ram',
      'id': 'S-1002',
      'present': false,
    },
    {
      'name': 'Sai',
      'id': 'S-1003',
      'present': true,
    },
    {
      'name': 'Neha',
      'id': 'S-1004',
      'present': false,
    },
    {
      'name': 'Isha',
      'id': 'S-1005',
      'present': true,
    },
  ];

  List<Map<String, dynamic>> get _filteredStudents {
    final query = _searchController.text.trim().toLowerCase();

    return _students.where((student) {
      final matchesQuery = query.isEmpty ||
          student['name'].toString().toLowerCase().contains(query) ||
          student['id'].toString().toLowerCase().contains(query);

      final matchesFilter = _activeFilter == 'All' ||
          (_activeFilter == 'Present' && student['present'] == true) ||
          (_activeFilter == 'Absent' && student['present'] == false);

      return matchesQuery && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Classroom',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF1f2b5b)),
        ),
      ),
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderWithStats(),
            const SizedBox(height: 20),
            _buildSearchAndFilters(),
            const SizedBox(height: 16),
            const Text(
              'Students',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1f2b5b),
              ),
            ),
            const SizedBox(height: 10),
            ..._filteredStudents.map((student) {
              final bool isPresent = student['present'] == true;
              return _buildStudentCard(
                name: student['name'],
                id: student['id'],
                cardColor: Colors.white,
                avatarColor: const Color(0xFFE9ECF4),
                isPresent: isPresent,
                isDark: false,
                onToggle: () {
                  setState(() {
                    student['present'] = !(student['present'] == true);
                  });
                },
                onDelete: () {
                  setState(() {
                    _students.remove(student);
                  });
                },
              );
            }).toList(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      
    );
  }

  Widget _buildHeaderWithStats() {
    final int total = _students.length;
    final int present = _students.where((s) => s['present'] == true).length;
    final int absent = total - present;

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3F51B5), Color(0xFF6D5DF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white24,
                child: Icon(Icons.class_, color: Colors.white, size: 26),
              ),
              SizedBox(width: 12),
              Text(
                'Class 9-A',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildStatChip(label: 'Total', value: total.toString(), color: Colors.white),
              const SizedBox(width: 8),
              _buildStatChip(label: 'Present', value: present.toString(), color: const Color(0xFFB2FFAB)),
              const SizedBox(width: 8),
              _buildStatChip(label: 'Absent', value: absent.toString(), color: const Color(0xFFFFCDD2)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({required String label, required String value, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search by name or ID',
              prefixIcon: const Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildFilterChip('All'),
            const SizedBox(width: 8),
            _buildFilterChip('Present'),
            const SizedBox(width: 8),
            _buildFilterChip('Absent'),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label) {
    final bool selected = _activeFilter == label;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {
        setState(() {
          _activeFilter = label;
        });
      },
      selectedColor: const Color(0xFF2720ff).withOpacity(0.12),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: selected ? const Color(0xFF2720ff) : Colors.black87,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: selected ? const Color(0xFF2720ff) : const Color(0xFFE0E3EB)),
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
    VoidCallback? onToggle,
    VoidCallback? onDelete,
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
            InkWell(
              onTap: onToggle,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  isPresent ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: isPresent ? const Color(0xFF4CAF50) : iconColor.withOpacity(0.7),
                  size: 26,
                ),
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: onDelete,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.delete_outline,
                  color: iconColor.withOpacity(0.7),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
