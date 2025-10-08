import 'package:flutter/material.dart';
import 'loginpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: Stack(
        children: [
          Positioned(
            top: -size.width * 0.6,
            right: -size.width * 0.3,
            child: _blob(size.width * 1.1, const Color(0xFFEAF2FF)),
          ),
          Positioned(
            bottom: -size.width * 0.7,
            left: -size.width * 0.2,
            child: _blob(size.width * 1.2, const Color(0xFFF1F3FA)),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2720ff),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(Icons.school, color: Colors.white, size: 46),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ClassMitra',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1f2b5b),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Effortless classroom management for teachers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 28),
                    _featureRow(Icons.fact_check_outlined, 'Smart attendance',
                        'Quickly take and review attendance.'),
                    const SizedBox(height: 10),
                    _featureRow(Icons.notifications_outlined, 'Class updates',
                        'Stay on top of schedules and alerts.'),
                    const SizedBox(height: 10),
                    _featureRow(Icons.analytics_outlined, 'Insights',
                        'Track trends and student progress.'),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2720ff),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _blob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _featureRow(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF3F51B5)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Color(0xFF1f2b5b),
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                      fontSize: 13)),
            ],
          ),
        )
      ],
    );
  }
}


