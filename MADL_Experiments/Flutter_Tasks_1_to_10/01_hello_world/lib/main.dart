import 'package:flutter/material.dart';

void main() => runApp(const HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.teal.shade50.withOpacity(0.4),
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.teal.withOpacity(0.2),
          title: const Text(
            'Experiment 1: Hello World',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 28),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.teal.shade100, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.flutter_dash,
                    size: 56,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome to Mobile Application Development',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
                const SizedBox(height: 18),
                Chip(
                  label: const Text(
                    'Experiment 01 • Active',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Colors.teal.shade50,
                  side: BorderSide(color: Colors.teal.shade200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
