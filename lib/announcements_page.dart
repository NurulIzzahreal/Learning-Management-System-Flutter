import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  int _selectedIndex = 0; // Default Home

  // Data dummy untuk pengumuman
  final List<Map<String, dynamic>> announcements = [
    {
      'title': 'Maintenance Pra UAS Semester Genap 2020/2021',
      'description': 'Maintenance LMS akan dilakukan pada tanggal 15-16 Januari 2021',
      'author': 'By Admin Celoe',
      'date': 'Senin, 11 Januari 2021, 7:52',
      'isImportant': true,
    },
    {
      'title': 'Jadwal Ujian Akhir Semester',
      'description': 'Jadwal UAS Semester Genap 2020/2021 sudah dapat diakses',
      'author': 'By Admin Celoe',
      'date': 'Minggu, 10 Januari 2021, 14:30',
      'isImportant': true,
    },
    {
      'title': 'Panduan Penggunaan LMS Mobile',
      'description': 'Tutorial lengkap penggunaan aplikasi LMS mobile untuk mahasiswa',
      'author': 'By Admin Celoe',
      'date': 'Sabtu, 9 Januari 2021, 10:15',
      'isImportant': false,
    },
    {
      'title': 'Perubahan Jadwal Kelas Sistem Operasi',
      'description': 'Kelas Sistem Operasi hari Jumat dipindah ke hari Kamis',
      'author': 'By Dosen Sistem Operasi',
      'date': 'Jumat, 8 Januari 2021, 16:45',
      'isImportant': true,
    },
    {
      'title': 'Pengumuman Libur Nasional',
      'description': 'Hari libur nasional tanggal 1 Januari 2021',
      'author': 'By Admin Celoe',
      'date': 'Kamis, 7 Januari 2021, 9:20',
      'isImportant': false,
    },
    {
      'title': 'Workshop Pemrograman Mobile',
      'description': 'Workshop gratis untuk mahasiswa yang tertarik pemrograman mobile',
      'author': 'By Fakultas Teknik',
      'date': 'Rabu, 6 Januari 2021, 11:10',
      'isImportant': true,
    },
    {
      'title': 'Update Fitur Diskusi Online',
      'description': 'Fitur diskusi online telah ditingkatkan dengan kemampuan video call',
      'author': 'By Admin Celoe',
      'date': 'Selasa, 5 Januari 2021, 13:25',
      'isImportant': false,
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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Pengumuman',
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
              // Info header
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
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.campaign,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Pengumuman',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${announcements.length} Pengumuman',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B0000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Daftar Pengumuman
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: announcements.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final announcement = announcements[index];
                  return _buildAnnouncementCard(announcement, index);
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
            _onItemTapped(index, context);
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

  // Widget untuk membuat card pengumuman
  Widget _buildAnnouncementCard(Map<String, dynamic> announcement, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        border: Border.all(
          color: announcement['isImportant'] 
              ? const Color(0xFF8B0000).withOpacity(0.3)
              : Colors.grey.withOpacity(0.2),
          width: announcement['isImportant'] ? 1.5 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon megaphone
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: announcement['isImportant']
                  ? const Color(0xFFFFEBEE)
                  : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.campaign,
                color: announcement['isImportant']
                    ? const Color(0xFF8B0000)
                    : Colors.black54,
                size: 20,
              ),
            ),
          ),
          
          // Konten pengumuman
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge penting (jika perlu)
                if (announcement['isImportant'])
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEE),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFF8B0000).withOpacity(0.3),
                      ),
                    ),
                    child: const Text(
                      'PENTING',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF8B0000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                
                // Judul pengumuman
                Text(
                  announcement['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                
                // Deskripsi pengumuman
                Text(
                  announcement['description'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                
                // Metadata: author dan tanggal
                Row(
                  children: [
                    // Author
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          announcement['author'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    
                    // Tanggal
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          announcement['date'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // Garis pemisah waktu relatif
                if (index < announcements.length - 1)
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
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
            backgroundColor: Color(0xFF8B0000),
          ),
        );
        break;
    }
  }
}