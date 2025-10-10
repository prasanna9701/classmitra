import 'package:flutter/material.dart';
import 'bottompage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Punjabi', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      const Text(
                        'ClassMitra',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f2b5b),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Welcome back. Please sign in to continue.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Teacher Id',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Teacher ID",
                          prefixIcon: const Icon(Icons.badge_outlined),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ---- School ID ----
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'School ID',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your School ID",
                          prefixIcon: const Icon(Icons.school_outlined),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // ---- Captcha ----
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Captcha Verification',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Captcha',
                                ),
                              ),
                             ),
                        
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.volume_up_outlined),
                            color: Colors.blue,
                            onPressed: () {},
                          ),
                        ],
                      ),

                      // ---- Language Dropdown ----
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedLanguage,
                        decoration: InputDecoration(
                          labelText: "Select Language",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                        ),
                        items: _languages.map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(language),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLanguage = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 28),

                      // ---- Login Button ----
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2720ff),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Bottomnav()),
                                );},
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // ---- Footer ----
                      Text(
                        "© ClassMitra",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 138, 135, 135), fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

