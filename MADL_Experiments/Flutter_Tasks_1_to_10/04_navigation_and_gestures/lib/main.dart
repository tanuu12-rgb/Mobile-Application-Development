import 'package:flutter/material.dart';

void main() => runApp(const NavigationApp());

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation & Gestures',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: Brightness.light,
          ),
        ),
        routes: {
          '/': (_) => const HomePage(),
          '/profile': (_) => const ProfilePage(),
        },
        initialRoute: '/',
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _notify(BuildContext context, String message, IconData icon) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(message),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF4FBF9),
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Experiment 4: Gestures & Navigation',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _notify(context, 'Single tap detected', Icons.touch_app_rounded),
                  onDoubleTap: () => _notify(context, 'Double tap detected', Icons.done_all_rounded),
                  onLongPress: () => _notify(context, 'Long press detected', Icons.timer_outlined),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.teal.shade200, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.08),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.touch_app_rounded, size: 44, color: Colors.teal),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Interactive Gesture Zone',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap, double-tap, or long-press me',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTag('1x Tap'),
                            const SizedBox(width: 8),
                            _buildTag('2x Tap'),
                            const SizedBox(width: 8),
                            _buildTag('Hold'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                  icon: const Icon(Icons.person_outline_rounded),
                  label: const Text('Open Profile Screen', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11, color: Colors.teal, fontWeight: FontWeight.w600)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF4FBF9),
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text('User Profile', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.teal.shade100),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person_rounded, size: 48, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Navigation Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  'Successfully navigated from Home page',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.arrow_back_rounded, size: 18),
                  label: const Text('Back to Home'),
                ),
              ],
            ),
          ),
        ),
      );
}
