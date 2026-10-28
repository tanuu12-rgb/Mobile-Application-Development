import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Calculator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo,
            brightness: Brightness.light,
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.indigo, width: 1.8),
            ),
          ),
        ),
        home: const CalculatorPage(),
      );
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final first = TextEditingController();
  final second = TextEditingController();
  String result = 'Result will appear here';

  void calculate(String op) {
    final a = double.tryParse(first.text);
    final b = double.tryParse(second.text);
    if (a == null || b == null) {
      setState(() => result = 'Please enter two valid numbers');
      return;
    }
    if (op == '/' && b == 0) {
      setState(() => result = 'Cannot divide by zero');
      return;
    }
    final value = switch (op) {
      '+' => a + b,
      '-' => a - b,
      '×' => a * b,
      '/' => a / b,
      _ => 0.0,
    };
    setState(() => result = 'Result: $value');
  }

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF6F8FC),
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Experiment 7: Simple Calculator',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.indigo.shade100),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.calculate_rounded, size: 36, color: Colors.indigo),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Quick Calculator',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                ),
                const SizedBox(height: 4),
                Text(
                  'Perform basic arithmetic operations',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: first,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'First number',
                    prefixIcon: Icon(Icons.pin_outlined),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: second,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Second number',
                    prefixIcon: Icon(Icons.pin_outlined),
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Select Operation:',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['+', '-', '×', '/']
                      .map(
                        (op) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () => calculate(op),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade600,
                                foregroundColor: Colors.white,
                                elevation: 2,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                op,
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.indigo.shade100),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.output_rounded, color: Colors.indigo, size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: result.contains('Error') || result.contains('Please') || result.contains('Cannot')
                                ? Colors.red.shade700
                                : Colors.indigo.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
