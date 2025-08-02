import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        backgroundColor: const Color.fromARGB(255, 64, 170, 188),
      ),
      body: SingleChildScrollView( // เผื่อข้อมูลยาวเลื่อนได้
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // === รูปภาพส่วนตัว ===
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(
                  'assets/p1.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'ไม่สามารถโหลดรูปภาพได้',
                      style: TextStyle(color: Colors.red),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // === ชื่อ ===
            Text(
              'นายธนวิชญ์ สิงห์เปีย',
              style: GoogleFonts.prompt(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // === ภูมิลำเนา ===
            Text(
              'ภูมิลำเนา: จังหวัดชัยนาท',
              style: GoogleFonts.prompt(fontSize: 18),
            ),
            const SizedBox(height: 8),

            // === งานอดิเรก ===
            Text(
              'งานอดิเรก: ฟังเพลง , ดูซีรีย์',
              style: GoogleFonts.prompt(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // === ประวัติการศึกษา ===
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ประวัติการศึกษา',
                style: GoogleFonts.prompt(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ลิสต์การศึกษา
            educationItem('ประถมศึกษา', 'โรงเรียนถาวรวิทยา', '2559'),
            educationItem('มัธยมศึกษาตอนต้น', 'โรงเรียนหนองฉางวิทยา', '2562'),
            educationItem('มัธยมศึกษาตอนปลาย', 'โรงเรียนกาญจนาภิเษกวิทยาลัย อุทัยธานี', '2565'),
          ],
        ),
      ),
    );
  }

  // Widget ย่อยสำหรับรายการการศึกษา
  Widget educationItem(String level, String school, String year) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              '$level: $school (ปี $year)',
              style: GoogleFonts.prompt(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
