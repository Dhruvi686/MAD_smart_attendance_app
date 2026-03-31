import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  final List<Map<String, String>> _history = const [
    {'date': '2026-03-30', 'status': 'Present'},
    {'date': '2026-03-29', 'status': 'Absent'},
    {'date': '2026-03-28', 'status': 'Present'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/scan'),
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan QR'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Attendance History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: _history.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = _history[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(item['date']!.split('-').last),
                    ),
                    title: Text(item['date']!),
                    subtitle: Text(item['status']!),
                    trailing: item['status'] == 'Present'
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.cancel, color: Colors.red),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
