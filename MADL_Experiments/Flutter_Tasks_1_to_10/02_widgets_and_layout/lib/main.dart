import 'package:flutter/material.dart';

void main() => runApp(const LayoutApp());

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets and Layout',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF7F8FC),
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Experiment 2: Widgets & Layout',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Styled Container with gradient & padding
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple.shade600, Colors.indigo.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.25),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(Icons.dashboard_customize_rounded, color: Colors.white, size: 36),
                    SizedBox(height: 10),
                    Text(
                      'A Container with padding',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Styled Row of Icons
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.deepPurple.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconBadge(Icons.home_rounded, 'Home', Colors.deepPurple),
                    _buildIconBadge(Icons.favorite_rounded, 'Favorite', Colors.redAccent),
                    _buildIconBadge(Icons.star_rounded, 'Featured', Colors.amber.shade700),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Modern Styled Card
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.phone_android_rounded, color: Colors.deepPurple),
                    ),
                    title: const Text(
                      'Flutter Widgets',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    subtitle: const Text(
                      'Build interfaces from reusable widgets',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black38),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildIconBadge(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 30, color: color),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
