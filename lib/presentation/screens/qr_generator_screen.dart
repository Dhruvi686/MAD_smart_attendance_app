import 'package:flutter/material.dart';

class QRGeneratorScreen extends StatefulWidget {
  @override
  _QRGeneratorScreenState createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  String _selectedCourse = 'Computer Science 101';
  bool _isGenerated = false;

  void _generateQR() {
    setState(() {
      _isGenerated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Generate QR Code', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Class',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCourse,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.deepPurpleAccent),
                  items: ['Computer Science 101', 'Data Structures', 'Database Systems']
                      .map((course) => DropdownMenuItem(
                            value: course,
                            child: Text(course, style: TextStyle(fontSize: 16)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCourse = value!;
                      _isGenerated = false; // Reset QR code on selection change
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _generateQR,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text('Generate Code', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 48),
            if (_isGenerated)
              Expanded(
                child: FadeIn(
                  child: Column(
                    children: [
                      Text(
                        'Class: $_selectedCourse',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Students can scan this code to mark attendance',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 32),
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: Offset(0, 10))
                          ]
                        ),
                        child: Icon(Icons.qr_code_2, size: 220, color: Colors.black87), // Dummy QR
                      ),
                      SizedBox(height: 32),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Valid for 04:59', // hardcoded dummy timer
                          style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

// Simple dummy animation wrapper
class FadeIn extends StatefulWidget {
  final Widget child;
  const FadeIn({required this.child});
  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
