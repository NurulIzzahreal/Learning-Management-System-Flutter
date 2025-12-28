import 'package:flutter/material.dart';
import 'home_page.dart'; // Pastikan import HomePage

class MyClassesPage extends StatefulWidget {
  const MyClassesPage({super.key});

  @override
  _MyClassesPageState createState() => _MyClassesPageState();
}

class _MyClassesPageState extends State<MyClassesPage> {
  int _selectedIndex = 1; // Index 1 untuk Kelas Saya (active)

  // Data dummy untuk kelas saya
  final List<Map<String, dynamic>> myClasses = [
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/ui_design.png',
      'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'classCode': 'D4SM-42-03 [ADY]',
      'progress': 0.89,
      'progressText': '89% Selesai',
    },
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/civics.png',
      'title': 'KEWARGANEGARAAN',
      'classCode': 'D4SM-41-GAB1 [BBO] JUMAT 2',
      'progress': 0.86,
      'progressText': '86% Selesai',
    },
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/os.png',
      'title': 'SISTEM OPERASI',
      'classCode': 'D4SM-44-02 [DDS]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/mobile.png',
      'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
      'classCode': 'D4SM-41-GAB1 [APJ]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/english.png',
      'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
      'classCode': 'D4SM-41-GAB1 [ARS]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'year': '2021/2',
      'thumbnail': 'assets/images/multimedia.png',
      'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'classCode': 'D4SM-43-04 [TPR]',
      'progress': 0.90,
      'progressText': '90% Selesai',
    },
    {
      'year': '2021/2',
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF8B0000),
          ),
          onPressed: () {
            // Kembali ke HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B0000),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              // Informasi jumlah kelas
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B0000).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF8B0000).withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Kelas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '7 Kelas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B0000),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Semester 2021/2',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Daftar Kelas
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myClasses.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final course = myClasses[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thumbnail
                        Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF8B0000).withOpacity(0.1),
                            border: Border.all(
                              color: const Color(0xFF8B0000).withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: _getThumbnailIcon(course['thumbnail']),
                        ),
                        
                        // Informasi kelas
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Tahun akademik
                              Text(
                                course['year'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8B0000),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              
                              // Nama mata kuliah
                              Text(
                                course['title'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  height: 1.2,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              
                              // Kode kelas
                              Text(
                                course['classCode'],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 12),
                              
                              // Progress bar
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LinearProgressIndicator(
                                    value: course['progress'],
                                    backgroundColor: Colors.grey[200],
                                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B0000)),
                                    minHeight: 6,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        course['progressText'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF8B0000).withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          '${(course['progress'] * 100).toInt()}%',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF8B0000),
                                            fontWeight: FontWeight.bold,
                                          ),
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
          backgroundColor: const Color(0xFF8B0000),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.7),
          currentIndex: _selectedIndex,
          onTap: (index) {
            _onItemTapped(index, context); // Panggil method navigasi
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
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

  // Method untuk menentukan icon thumbnail
  Widget _getThumbnailIcon(String thumbnail) {
    switch (thumbnail) {
      case 'assets/images/ui_design.png':
        return const Center(
          child: Icon(
            Icons.design_services,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/civics.png':
        return const Center(
          child: Icon(
            Icons.account_balance,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/os.png':
        return const Center(
          child: Icon(
            Icons.computer,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/mobile.png':
        return const Center(
          child: Icon(
            Icons.phone_android,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/english.png':
        return const Center(
          child: Icon(
            Icons.language,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/multimedia.png':
        return const Center(
          child: Icon(
            Icons.videocam,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      case 'assets/images/sports.png':
        return const Center(
          child: Icon(
            Icons.sports_soccer,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
      default:
        return const Center(
          child: Icon(
            Icons.school,
            color: Color(0xFF8B0000),
            size: 32,
          ),
        );
    }
  }

  // Method untuk navigasi antar halaman via bottom nav
  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1: // Kelas Saya
        // Sudah di halaman ini, tidak perlu navigasi
        break;
      case 2: // Notifikasi
        // Untuk sementara, tampilkan snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Halaman Notifikasi akan segera tersedia'),
            backgroundColor: Color(0xFF8B0000),
          ),
        );
        break;
    }
  }
}