import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<CameraDescription>? cameras;
  CameraController? controller;

  final TextEditingController nameController = TextEditingController();
  final List<String> presentStudents = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      controller = CameraController(cameras![0], ResolutionPreset.medium);
      await controller!.initialize();
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    nameController.dispose();
    super.dispose();
  }

  void _markPresent(String name) {
    if (name.isNotEmpty && !presentStudents.contains(name)) {
      setState(() {
        presentStudents.add(name);
      });
      nameController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'Take Attendance',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Camera Preview or Icon
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.5), width: 1.5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: controller != null && controller!.value.isInitialized
                    ? CameraPreview(controller!)
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.blueAccent,
                              size: 60,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Camera will appear here',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // Manual entry
            const Text(
              'Enter Student Name (Manual)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter student name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => _markPresent(nameController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2720ff),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Present Students List
            const Text(
              'Present Students',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: presentStudents.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'No student marked yet.',
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: presentStudents.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.check_circle,
                              color: Colors.green),
                          title: Text(
                            presentStudents[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 30),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Attendance Submitted!'),
                    ),
                  );
                  setState(() {
                    presentStudents.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2720ff),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                child: const Text(
                  'Submit Attendance',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class AttendancePage extends StatefulWidget {
//   const AttendancePage({super.key});

//   @override
//   State<AttendancePage> createState() => _AttendancePageState();
// }

// class _AttendancePageState extends State<AttendancePage> {
//   List<CameraDescription>? cameras;
//   CameraController? controller;

//   final TextEditingController nameController = TextEditingController();
//   final List<String> presentStudents = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     cameras = await availableCameras();
//     if (cameras!.isNotEmpty) {
//       controller = CameraController(cameras![0], ResolutionPreset.medium);
//       await controller!.initialize();
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     nameController.dispose();
//     super.dispose();
//   }

//   void _markPresent(String name) {
//     if (name.isNotEmpty && !presentStudents.contains(name)) {
//       setState(() {
//         presentStudents.add(name);
//       });
//       nameController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Take Attendance'),
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Camera preview
//             if (controller != null && controller!.value.isInitialized)
//               Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: Colors.blueAccent, width: 1.5),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: CameraPreview(controller!),
//                 ),
//               )
//             else
//               Container(
//                 height: 250,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: const Text('Camera initializing...'),
//               ),
//             const SizedBox(height: 20),

//             // Manual entry
//             const Text(
//               'Enter Student Name (Manual)',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter student name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 ElevatedButton(
//                   onPressed: () => _markPresent(nameController.text),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF2720ff),
//                     padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//                   ),
//                   child: const Icon(Icons.check, color: Colors.white),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // List of Present Students
//             const Text(
//               'Present Students',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             presentStudents.isEmpty
//                 ? const Text('No student marked yet.')
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: presentStudents.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           leading: const Icon(Icons.check_circle, color: Colors.green),
//                           title: Text(presentStudents[index]),
//                         ),
//                       );
//                     },
//                   ),

//             const SizedBox(height: 20),
//             // Submit button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Attendance Submitted!')),
//                   );
//                   setState(() {
//                     presentStudents.clear();
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2720ff),
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text(
//                   'Submit Attendance',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
