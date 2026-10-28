import 'package:flutter/material.dart';

void main() => runApp(const ListViewApp());

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  final items = const [
    'Home',
    'Profile',
    'Courses',
    'Assignments',
    'Results',
    'Attendance',
    'Settings',
    'Help',
    'About',
    'Contact'
  ];

  static const List<IconData> _itemIcons = [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.menu_book_rounded,
    Icons.assignment_rounded,
    Icons.grade_rounded,
    Icons.calendar_month_rounded,
    Icons.settings_rounded,
    Icons.help_outline_rounded,
    Icons.info_outline_rounded,
    Icons.contact_mail_rounded,
  ];

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scrollable List Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFF9F9FC),
          appBar: AppBar(
            centerTitle: true,
            elevation: 1,
            backgroundColor: Colors.white,
            title: const Text(
              'Experiment 5: Scrollable List',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${items.length} items',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final icon = _itemIcons[index % _itemIcons.length];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.deepPurple.shade50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  leading: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: Colors.deepPurple, size: 22),
                  ),
                  title: Text(
                    items[index],
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  subtitle: Text(
                    'Option index #${index + 1}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.chevron_right_rounded, size: 18, color: Colors.black54),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        content: Text('Selected: ${items[index]}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
}
