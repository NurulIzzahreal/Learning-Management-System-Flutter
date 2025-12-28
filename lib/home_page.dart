// lib/home_page.dart
import 'package:flutter/material.dart';
import 'my_classes_page.dart';
import 'task_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // ... data courses dan kode lainnya ...

  // ========== TAMBAHKAN METHOD INI ==========
  void _onItemTapped(int index) {
    // Update UI terlebih dahulu
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman yang sesuai
    switch (index) {
      case 0: // Home
        // Sudah di Home, tidak perlu navigasi
        break;
      case 1: // Kelas Saya
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyClassesPage()),
        );
        break;
      case 2: // Notifikasi
        // Untuk sementara, tampilkan snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Halaman Notifikasi akan segera tersedia'),
            backgroundColor: Color(0xFF800000),
          ),
        );
        break;
    }
  }

  // Data dummy untuk progres kelas
  final List<Map<String, dynamic>> courses = [
    {
      'thumbnail': 'assets/images/ui_design.png',
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'classCode': 'D4SM-42-03 [ADY]',
      'progress': 0.89,
      'progressText': '89% selesai',
    },
    {
      'thumbnail': 'assets/images/civics.png',
      'title': 'KEWARGANEGARAAN',
      'classCode': 'D4SM-41-GAB1 [BBO] JUMAT 2',
      'progress': 0.26,
      'progressText': '26% Selesai',
    },
    {
      'thumbnail': 'assets/images/os.png',
      'title': 'SISTEM OPERASI',
      'classCode': 'D4SM-44-02 [DDS]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'thumbnail': 'assets/images/mobile.png',
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'classCode': 'D4SM-41-GAB1 [APJ]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'thumbnail': 'assets/images/english.png',
      'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'classCode': 'D4SM-41-GAB1 [ARS]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'thumbnail': 'assets/images/multimedia.png',
      'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'classCode': 'D4SM-43-04 [TPR]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'thumbnail': 'assets/images/sports.png',
      'title': 'OLAHRAGA',
      'classCode': 'D3TT-44-02 [EYR]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Di dalam class _HomePageState di home_page.dart
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        elevation: 0,
        automaticallyImplyLeading: false, // Nonaktifkan back button otomatis
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hallo,',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 2),
                const Text(
                  'NURUL IZZAH',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'Mahasiswa',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Section: Tugas Yang Akan Datang
              const Text(
                'Tugas Yang Akan Datang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),

              // Card Tugas - DIBUNGKUS DENGAN GestureDetector
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailPage(
                        taskTitle: 'Tugas 01 - UID Android Mobile Game',
                        courseName: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF800000),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF800000).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAMA MATA KULIAH
                      const Text(
                        'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // JUDUL TUGAS
                      const Text(
                        'Tugas 01 - UID Android Mobile Game',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // DEADLINE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Waktu Pengumpulan: ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Segera',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellow[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Section: Pengumuman Terakhir
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pengumuman Terakhir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman semua pengumuman
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF800000),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF800000).withOpacity(0.9),
                      const Color(0xFF800000).withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/maintenance_banner.png'),
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'INFO',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Maintenance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Maintenance Pra UAS Semester Genap 2020/2021',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Maintenance LMS',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '26 Mei 2021',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          child: const Text(
                            'Detail',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section: Progres Kelas
              const Text(
                'Progres Kelas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        // Thumbnail
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFF800000).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:
                              course['thumbnail'] ==
                                  'assets/images/ui_design.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.design_services,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : course['thumbnail'] ==
                                    'assets/images/civics.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.account_balance,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : course['thumbnail'] == 'assets/images/os.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.computer,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : course['thumbnail'] ==
                                    'assets/images/mobile.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : course['thumbnail'] ==
                                    'assets/images/english.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.language,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : course['thumbnail'] ==
                                    'assets/images/multimedia.png'
                              ? const Center(
                                  child: Icon(
                                    Icons.videocam,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                )
                              : const Center(
                                  child: Icon(
                                    Icons.sports_soccer,
                                    color: Color(0xFF800000),
                                    size: 24,
                                  ),
                                ),
                        ),
                        const SizedBox(width: 12),
                        // Course Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course['title'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                course['classCode'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Progress Bar
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LinearProgressIndicator(
                                    value: course['progress'],
                                    backgroundColor: Colors.grey[200],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFF800000),
                                        ),
                                    minHeight: 6,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        course['progressText'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${(course['progress'] * 100).toInt()}%',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF800000),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 80), // Spacer untuk bottom navigation
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF800000),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onItemTapped(index); // Panggil method navigasi
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Kelas Saya',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
          ],
        ),
      ),
    );
  }
}
