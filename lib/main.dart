import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import ไลบรารี Material ของ Flutter

void main() {
  // จุดเริ่มต้นของแอป Flutter
  runApp(const MyApp()); // บอก Flutter ว่าวิดเจ็ตใดคือรากฐานของแอป
}

// MyApp โดยทั่วไปคือวิดเจ็ตรากฐานของแอปพลิเคชันของคุณ
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // เมธอด build() ส่งคืนโครงสร้างต้นไม้วิดเจ็ตสำหรับวิดเจ็ตนี้
    return MaterialApp(
      title: 'My Awesome App',
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // ใช้ Material Design เวอร์ชันล่าสุด
      ),
      home: const MyHomePage(), // วิดเจ็ตหน้าจอหลักของคุณ
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ภายในเมธอด build ของ MyHomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter 4'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        // เพิ่ม Padding รอบ Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ใช้ Column สำหรับเลย์เอาต์แนวตั้ง
          // crossAxisAlignment:
          //    CrossAxisAlignment.center, // จัดกึ่งกลางไอเท็มแนวนอน
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // วิดเจ็ตต่างๆ จะมาที่นี่ภายในลิสต์ children ของ Column
            Image.network('https://picsum.photos/seed/flutter/400/200'),
            const SizedBox(height: 16.0),
            Image.asset(
              'assets/p1.jpg',
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'ไม่สามารถโหลดรูปภาพได้',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),
            Container(
              width: 300.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 126, 226),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                "สวัสดี Flutter",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                //style: TextStyle(
                //  fontSize: 20.0,
                //   fontWeight: FontWeight.bold,
                //   color: Color.fromARGB(255, 11, 7, 255),
                // ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดกึ่งกลางปุ่มแนวนอน
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Icon(Icons.person),
                ),
                const SizedBox(width: 10), // เว้นวรรคระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 30,
              tooltip: 'ข้อมูล', // ข้อความช่วยเหลือ
              color: Colors.blueGrey,
            ),

            // Placeholder ชั่วคราว
          ],
        ),
      ),
    );
  }
}