import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Class Teacher Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1f2b5b),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeaderCard(),
          const SizedBox(height: 16),
          _buildInfoCard(),
          const SizedBox(height: 16),
          _buildContactCard(),
          const SizedBox(height: 16),
          _buildActionsCard(context),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundColor: Color(0xFFE9ECF4),
            child: Icon(Icons.person, size: 40, color: Color(0xFF1f2b5b)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Ms. A. Sharma',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1f2b5b),
                    )),
                SizedBox(height: 4),
                Text('Class Teacher • 9-A',
                    style: TextStyle(color: Colors.black54, fontSize: 14)),
              ],
            ),
          ),
          const Chip(
            label: Text('Active', style: TextStyle(color: Colors.white)),
            backgroundColor: Color(0xFF4DB6AC),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return _cardWrapper(
      title: 'Professional Details',
      child: Column(
        children: const [
          _InfoRow(label: 'Employee ID', value: 'EMP-09231'),
          _InfoRow(label: 'Qualification', value: 'M.Sc, B.Ed'),
          _InfoRow(label: 'Experience', value: '7 years'),
          _InfoRow(label: 'Subjects', value: 'Mathematics, Science'),
        ],
      ),
    );
  }

  Widget _buildContactCard() {
    return _cardWrapper(
      title: 'Contact',
      child: Column(
        children: const [
          _InfoRow(label: 'Email', value: 'asharma@school.edu'),
          _InfoRow(label: 'Phone', value: '+91 98XXXXXX12'),
          _InfoRow(label: 'Room', value: 'Block B • 203'),
        ],
      ),
    );
  }

  Widget _buildActionsCard(BuildContext context) {
    return _cardWrapper(
      title: 'Quick Actions',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ActionButton(icon: Icons.edit_outlined, label: 'Edit Profile', onTap: () {}),
          _ActionButton(icon: Icons.picture_as_pdf_outlined, label: 'Export', onTap: () {}),
          _ActionButton(icon: Icons.settings_outlined, label: 'Settings', onTap: () {}),
        ],
      ),
    );
  }

  Widget _cardWrapper({required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1f2b5b),
              )),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyle(color: Colors.grey[600])),
          ),
          Text(value,
              style: const TextStyle(
                color: Color(0xFF1f2b5b),
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F5FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF1f2b5b)),
            const SizedBox(height: 6),
            Text(label,
                style: const TextStyle(
                  color: Color(0xFF1f2b5b),
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );
  }
}


