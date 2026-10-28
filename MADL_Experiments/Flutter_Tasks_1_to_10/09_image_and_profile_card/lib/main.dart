import 'package:flutter/material.dart';

void main() => runApp(const ProfileCardApp());

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Profile Card',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6366F1),
            brightness: Brightness.light,
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF3F4F6),
          appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.white,
            title: const Text(
              'Experiment 9: Profile Card',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.indigo.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top banner
                    Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
                      ),
                    ),
                    // Avatar overlapping banner
                    Transform.translate(
                      offset: const Offset(0, -45),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 46,
                              backgroundColor: Colors.indigo.shade50,
                              child: const Icon(Icons.person, size: 52, color: Color(0xFF6366F1)),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Flutter Student',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'B.Tech Information Technology',
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Mobile App Developer',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF6366F1)),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Divider(indent: 24, endIndent: 24, height: 1),
                          const SizedBox(height: 14),
                          // Information Tiles
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                _buildInfoTile(
                                  icon: Icons.email_rounded,
                                  iconColor: Colors.blueAccent,
                                  bgColor: Colors.blue.shade50,
                                  title: 'Email Address',
                                  value: 'student@example.com',
                                ),
                                const SizedBox(height: 10),
                                _buildInfoTile(
                                  icon: Icons.code_rounded,
                                  iconColor: Colors.purpleAccent,
                                  bgColor: Colors.purple.shade50,
                                  title: 'Specialization',
                                  value: 'Flutter Developer in Training',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  static Widget _buildInfoTile({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
                Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
