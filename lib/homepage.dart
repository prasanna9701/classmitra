import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

class StatusBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color labelColor;
  final int number;

  const StatusBox({
    Key? key,
    required this.icon,
    required this.label,
    required this.labelColor,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: labelColor.withOpacity(0.2), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24, color: labelColor),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1f2b5b),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                '$number',
                style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xFF1f2b5b),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA), // Soft background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Class Card (Centered)
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Color(0xFFF6F8FA),
                shadowColor: Colors.black12,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center text horizontally
                    children: const [
                      Text(
                        "Class 9A",
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1f2b5b),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),

              // My Actions
              const Text(
                'My Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1f2b5b),
                ),
              ),
              SizedBox(height: height * 0.02),

              // Attendance Taken Box
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green.withOpacity(0.3), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 3,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Attendance Taken',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1f2b5b),
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.check_circle, color: Color(0xFF4DB6AC), size: 28),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04),

              // Overview Section
              Row(
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1f2b5b),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('MMM d, yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1f2b5b),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              Row(
                children: const [
                  StatusBox(
                    icon: Icons.group_outlined,
                    label: 'Total Students',
                    labelColor: Color(0xFF5C6BC0),
                    number: 73,
                  ),
                  StatusBox(
                    icon: Icons.check_circle_outline,
                    label: 'Present',
                    labelColor: Color(0xFF4DB6AC),
                    number: 63,
                  ),
                ],
              ),
              Row(
                children: const [
                  StatusBox(
                    icon: Icons.close_rounded,
                    label: 'Absent',
                    labelColor: Color.fromARGB(255, 231, 174, 174),
                    number: 10,
                  ),
                  StatusBox(
                    icon: Icons.access_time_outlined,
                    label: 'Late',
                    labelColor: Color(0xFFFFA726),
                    number: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:intl/intl.dart';

// // Your StatusBox widget (unchanged)
// class StatusBox extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color labelColor;
//   final int number;

//   const StatusBox({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.labelColor,
//     required this.number,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.all(8),
//         height: MediaQuery.of(context).size.height * 0.12,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(22),
//           border: Border.all(color: labelColor.withOpacity(0.2), width: 1.5),
//           boxShadow: [
//             BoxShadow(
//               color: labelColor.withOpacity(0.08),
//               blurRadius: 15,
//               spreadRadius: 2,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(icon, size: 22, color: labelColor),
//                   const SizedBox(width: 10),
//                   Flexible(
//                     child: Text(
//                       label,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFF1f2b5b),
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 '$number',
//                 style: const TextStyle(
//                   fontSize: 25,
//                   color: Color(0xFF1f2b5b),
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Your main HomePage widget, updated:
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Soft, professional background
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.03),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 elevation: 6,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                 color: Colors.white,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.025),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [

//                       const Text(
//                         "Class 9A",
//                         style: TextStyle(
//                           fontFamily: 'poppins',
//                           fontSize: 24,
//                          fontWeight: FontWeight.bold,
//                           color: Color(0xFF1f2b5b),
//                         ),
//                       ),
                   
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 0.04),

//               // Key Actions Section - Responsive single row
//               const Text(
//                 'My Actions',
//                 style: TextStyle(
//                   fontSize: 20,
//                  fontWeight: FontWeight.bold, 
//                   color: Color(0xFF1f2b5b),
//                 ),
//               ),
//               SizedBox(height: height * 0.02),
// // Attendance Taken Box
// Container(
//   margin: const EdgeInsets.all(8),
//   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//   height: MediaQuery.of(context).size.height * 0.12,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(22),
//     border: Border.all(color: Colors.green.withOpacity(0.2), width: 1.5),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.green.withOpacity(0.08),
//         blurRadius: 15,
//         spreadRadius: 2,
//         offset: const Offset(0, 6),
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: const [
     
//       Text(
//         'Attendance Taken',
//         style: TextStyle(
//           fontSize: 23,
//           fontWeight: FontWeight.bold,
//           color: Color(0xFF1f2b5b),
//         ),
//       ),
//        SizedBox(width: 40),
//        Icon(Icons.check_circle, color: Color(0xFF4DB6AC), size: 28),
     
//     ],
//   ),
// ),


//               // LayoutBuilder(
//               //   builder: (context, constraints) {
//               //     // Adjust diameter and spacing based on maxWidth
//               //     double diameter;
//               //     double spacing;

                 

//               //     return Center(
//               //       child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //           _ActionCircle(
//               //             icon: Icons.notifications,
//               //             label: 'Alerts',
//               //             count: 3,
//               //             iconColor: Colors.orange[700]!,
//               //             textColor: Colors.orange[900]!,
                          
//               //             diameter: 100,
//               //           ),
//               //           SizedBox(width: 20),
//               //           _ActionCircle(
//               //             icon: Icons.access_time,
//               //             label: 'Remainder',
//               //             count: 4,
//               //             iconColor: Colors.green[700]!,
//               //             textColor: Colors.green[900]!,
//               //             diameter: 100,
//               //           ),
//               //           SizedBox(width: 20),
//               //           _ActionCircle(
//               //             icon: Icons.schedule,
//               //             label: 'Hours left',
//               //             count: 4,
//               //             iconColor: const Color(0xFF2720ff),
//               //             textColor: const Color(0xFF1f2b5b),
//               //             diameter: 100,
//               //           ),
//               //         ],
//               //       ),
//               //     );
//               //   },
//               // ),

//               SizedBox(height: height * 0.04),

//               // Overview Section
//               Row(
//                 children: [
//                   const Text(
//                     'Overview',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF1f2b5b),
//                     ),
                    
//                   ),
//                    Spacer(),
//                         Text(
//                           DateFormat('MMM d, yyyy').format(DateTime.now()),
//                           style: TextStyle(fontSize:14, color: Color(0xFF1f2b5b), fontWeight: FontWeight.w500),
//                         ),
//                 ],
//               ),
//               SizedBox(height: height * 0.02),

//               Row(
//                 children: const [
//                   StatusBox(
//                     icon: Icons.group_outlined,
//                     label: 'Total Students',
//                     labelColor: Color(0xFF5C6BC0),
//                     number: 73,
//                   ),
//                   StatusBox(
//                     icon: Icons.check_circle_outline,
//                     label: 'Present',
//                     labelColor: Color(0xFF4DB6AC),
//                     number: 63,
//                   ),
//                 ],
//               ),
              
//               Row(
//                 children: const [
                  
//                   StatusBox(
//                     icon: Icons.close_rounded,
//                     label: 'Absent',
//                     labelColor: Color.fromARGB(255, 231, 174, 174),
//                     number: 10,
//                   ),
//                   StatusBox(
//                     icon: Icons.access_time_outlined,
//                     label: 'Late',
//                     labelColor: Color(0xFFFFA726),
//                     number: 5,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () => openDialog(context),
//       //   backgroundColor: const Color(0xFF2720ff),
//       //   child: const Icon(Icons.mic, color: Colors.white, size: 28),
//       //   elevation: 6,
//       //   shape: const CircleBorder(),
//       // ),
//     );
//   }
// }

// // The updated _ActionCircle widget (unchanged)
// class _ActionCircle extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final int count;
//   final Color iconColor;
//   final Color textColor;
//   final double diameter;

//   const _ActionCircle({
//     required this.icon,
//     required this.label,
//     required this.count,
//     required this.iconColor,
//     required this.textColor,
//     required this.diameter,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: diameter,
//       height: diameter,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             spreadRadius: 3,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor, size: diameter * 0.3),
//           const SizedBox(height: 5),
//           Text(
//             '$count',
//             style: TextStyle(
//               fontSize: diameter * 0.2,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: diameter * 0.12,
//               color: textColor,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Dialog & helper widgets unchanged
// Future<void> openDialog(BuildContext context) async {
//   return showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//         side: BorderSide(color: Colors.blueAccent.withOpacity(0.15), width: 1.5),
//       ),
//       elevation: 10,
//       contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
//       icon: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: const Color(0xFF2720ff),
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF2720ff).withOpacity(0.4),
//               blurRadius: 15,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: const Icon(Icons.mic, color: Colors.white, size: 32),
//       ),
//       title: const Text(
//         'Voice Assistant',
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 22, color: Color(0xFF1f2b5b), fontWeight: FontWeight.bold),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'Speak into the microphone to give commands.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 20),
//           _buildActionItem('• Search for patient information'),
//           _buildActionItem('• Add notes through voice'),
//           const SizedBox(height: 10),
//         ],
//       ),
//       actionsAlignment: MainAxisAlignment.center,
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           style: TextButton.styleFrom(
//             backgroundColor: const Color(0xFF2720ff),
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             elevation: 4,
//           ),
//           child: const Text(
//             'Dismiss',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildActionItem(String text) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4),
//     child: Text(
//       text,
//       style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w400),
//       textAlign: TextAlign.left,
//     ),
//   );
// }
