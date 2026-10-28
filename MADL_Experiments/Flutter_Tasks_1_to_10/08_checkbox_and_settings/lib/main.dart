import 'package:flutter/material.dart';

void main() => runApp(const SettingsApp());

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Settings',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            brightness: Brightness.light,
          ),
        ),
        home: const SettingsPage(),
      );
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Experiment 8: App Settings',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          children: [
            _buildSectionHeader('Preferences', Icons.tune_rounded),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    secondary: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.notifications_active_outlined, color: Colors.deepOrange),
                    ),
                    title: const Text('Enable notifications', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    subtitle: const Text('Receive alerts and activity updates', style: TextStyle(fontSize: 12)),
                    value: notifications,
                    activeColor: Colors.deepOrange,
                    onChanged: (value) => setState(() => notifications = value),
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16, color: Colors.grey.shade200),
                  SwitchListTile(
                    secondary: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.dark_mode_outlined, color: Colors.deepOrange),
                    ),
                    title: const Text('Dark mode preference', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                    subtitle: const Text('Switch between light and dark look', style: TextStyle(fontSize: 12)),
                    value: darkMode,
                    activeColor: Colors.deepOrange,
                    onChanged: (value) => setState(() => darkMode = value),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            _buildSectionHeader('Agreement', Icons.gavel_rounded),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: CheckboxListTile(
                secondary: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.verified_user_outlined, color: Colors.deepOrange),
                ),
                title: const Text('I accept the terms and conditions', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                subtitle: const Text('Required to activate full account features', style: TextStyle(fontSize: 12)),
                value: acceptTerms,
                activeColor: Colors.deepOrange,
                onChanged: (value) => setState(() => acceptTerms = value ?? false),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Status Summary', Icons.summarize_outlined),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.shade50.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryRow('Notifications', notifications ? 'On' : 'Off', notifications),
                  const SizedBox(height: 10),
                  _buildSummaryRow('Dark mode preference', darkMode ? 'On' : 'Off', darkMode),
                  const SizedBox(height: 10),
                  _buildSummaryRow('Terms accepted', acceptTerms ? 'Yes' : 'No', acceptTerms),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.deepOrange),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? Colors.deepOrange : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
