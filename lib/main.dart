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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 206, 15, 63)),
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
        backgroundColor: const Color.fromARGB(255, 243, 14, 37),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/p1.jpg',
                  width: 180,
                  height: 180,
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
              'นางสาวสุธารส เกี๋ยงแก้ว',
              style: GoogleFonts.prompt(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // === การจัดกลุ่มข้อมูล (Card: ภูมิลำเนา + งานอดิเรก) ===
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ภูมิลำเนา',
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 243, 14, 37),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'จังหวัดลำปาง',
                      style: GoogleFonts.prompt(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'งานอดิเรก',
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 14, 37),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ดูภาพยนตร์, ฟังเพลง',
                      style: GoogleFonts.prompt(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ประวัติการศึกษา
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ประวัติการศึกษา',
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 14, 37),
                      ),
                    ),
                    const SizedBox(height: 10),
                    educationItem('ประถมศึกษา', 'โรงเรียนอนุบาลสบปราบ', '2559'),
                    educationItem('มัธยมศึกษาตอนต้น', 'โรงเรียนลำปางกัลยาณี', '2562'),
                    educationItem('มัธยมศึกษาตอนปลาย', 'โรงเรียนลำปางกัลยาณี', '2565'),
                  ],
                ),
              ),
            ),
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
