import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart';
import 'login_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  final List<Map<String, String>> _attendanceHistory = [
    {'date': 'Oct 25, 2023', 'course': 'Computer Science 101', 'status': 'Present'},
    {'date': 'Oct 24, 2023', 'course': 'Data Structures', 'status': 'Absent'},
    {'date': 'Oct 23, 2023', 'course': 'Database Systems', 'status': 'Present'},
    {'date': 'Oct 22, 2023', 'course': 'Software Engineering', 'status': 'Present'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Student Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5))
                ]
              ),
              child: Column(
                children: [
                  Icon(Icons.qr_code_scanner, size: 56, color: Colors.white),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QRScannerScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                    ),
                    child: Text('Scan QR Code', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Recent Attendance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _attendanceHistory.length,
                itemBuilder: (context, index) {
                  final record = _attendanceHistory[index];
                  final isPresent = record['status'] == 'Present';
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: isPresent ? Colors.green.withOpacity(0.15) : Colors.red.withOpacity(0.15),
                        child: Icon(
                          isPresent ? Icons.check : Icons.close,
                          color: isPresent ? Colors.green : Colors.red,
                        ),
                      ),
                      title: Text(record['course']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      subtitle: Text(record['date']!, style: TextStyle(color: Colors.grey[600])),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isPresent ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          record['status']!,
                          style: TextStyle(
                            color: isPresent ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
