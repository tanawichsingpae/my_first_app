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
        backgroundColor: const Color.fromARGB(255, 100, 203, 45),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // รูปภาพ
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

            // ชื่อ
            Text(
              'นายณฐวัฒน์ มีเดช',
              style: GoogleFonts.prompt(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            //ภูมิลำเนา + งานอดิเรก
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ภูมิลำเนา:',
                    style: GoogleFonts.prompt(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 100, 203, 45),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'จังหวัดร้อยเอ็ด',
                    style: GoogleFonts.prompt(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'งานอดิเรก:',
                    style: GoogleFonts.prompt(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 100, 203, 45),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ฟังเพลง , เล่นกีฬา',
                    style: GoogleFonts.prompt(fontSize: 18),
                  ),
                ],
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
                        color: Color.fromARGB(255, 100, 203, 45),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ระดับประถม
                    educationBlock(
                      level: 'ประถมศึกษา',
                      school: 'โรงเรียนเพลงเมตตาศึกษา',
                      year: '2559',
                    ),
                    const SizedBox(height: 12),

                    // ระดับม.ต้น
                    educationBlock(
                      level: 'มัธยมศึกษาตอนต้น',
                      school: 'โรงเรียนหล่มสักวิทยาคม',
                      year: '2562',
                    ),
                    const SizedBox(height: 12),

                    // ระดับม.ปลาย
                    educationBlock(
                      level: 'มัธยมศึกษาตอนปลาย',
                      school: 'โรงเรียนหล่มสักวิทยาคม',
                      year: '2565',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget educationBlock({
    required String level,
    required String school,
    required String year,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          level,
          style: GoogleFonts.prompt(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        Text(
          'โรงเรียน: $school',
          style: GoogleFonts.prompt(fontSize: 16),
        ),
        Text(
          'ปีที่จบ: $year',
          style: GoogleFonts.prompt(fontSize: 16),
        ),
      ],
    );
  }
}
