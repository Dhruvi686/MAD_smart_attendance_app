import 'package:flutter/material.dart';
import 'qr_generator_screen.dart';
import 'login_screen.dart';

class InstructorDashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _courses = [
    {'name': 'Computer Science 101', 'students': 45, 'attendance': '85%'},
    {'name': 'Data Structures', 'students': 40, 'attendance': '92%'},
    {'name': 'Database Systems', 'students': 35, 'attendance': '78%'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Instructor Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
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
                  colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.deepPurple.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5))
                ]
              ),
              child: Column(
                children: [
                  Icon(Icons.qr_code, size: 56, color: Colors.white),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QRGeneratorScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                    ),
                    child: Text('Generate Attendance QR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Your Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _courses.length,
                itemBuilder: (context, index) {
                  final course = _courses[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.book, color: Colors.deepPurpleAccent),
                      ),
                      title: Text(course['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      subtitle: Text('${course['students']} Enrolled Students', style: TextStyle(color: Colors.grey[600])),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Avg', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                          Text(
                            course['attendance'],
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent, fontSize: 16),
                          ),
                        ],
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Viewing attendance for ${course['name']}'))
                        );
                      },
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
