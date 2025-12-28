import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedIndex = 2; // Index 2 untuk Notifikasi (active)

  // Data notifikasi
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'tugas',
      'icon': Icons.assignment,
      'title': 'Pengumpulan Tugas',
      'message': 'Anda telah mengirimkan pengajuan tugas untuk "Pengumpulan Laporan Akhir Semester"',
      'time': 'Baru saja',
      'course': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'isRead': false,
      'timeDetails': '3 Hari 9 Jam Yang Lalu',
    },
    {
      'type': 'kuis',
      'icon': Icons.quiz,
      'title': 'Kuis Selesai',
      'message': 'Anda telah menyelesaikan kuis "Quiz Review 01 - UI Design Fundamentals"',
      'time': '1 jam yang lalu',
      'course': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'isRead': false,
      'timeDetails': '1 Hari 2 Jam Yang Lalu',
    },
    {
      'type': 'tugas',
      'icon': Icons.assignment_turned_in,
      'title': 'Tugas Dinilai',
      'message': 'Tugas "Wireframe & Prototype" telah dinilai oleh dosen',
      'time': '5 jam yang lalu',
      'course': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'isRead': true,
      'timeDetails': '2 Hari 5 Jam Yang Lalu',
    },
    {
      'type': 'pengumuman',
      'icon': Icons.announcement,
      'title': 'Pengumuman Baru',
      'message': 'Maintenance LMS akan dilakukan pada tanggal 15-16 Januari 2021',
      'time': '1 hari yang lalu',
      'course': 'Sistem LMS',
      'isRead': true,
      'timeDetails': '4 Hari Yang Lalu',
    },
    {
      'type': 'tugas',
      'icon': Icons.assignment_late,
      'title': 'Tenggat Waktu',
      'message': 'Tugas "Desain Aplikasi Lengkap" akan segera berakhir',
      'time': '2 hari yang lalu',
      'course': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
      'isRead': true,
      'timeDetails': '5 Hari Yang Lalu',
    },
    {
      'type': 'kuis',
      'icon': Icons.question_answer,
      'title': 'Kuis Baru',
      'message': 'Kuis baru "Final Review - Desain Visual" telah tersedia',
      'time': '3 hari yang lalu',
      'course': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'isRead': true,
      'timeDetails': '1 Minggu Yang Lalu',
    },
    {
      'type': 'tugas',
      'icon': Icons.assignment_returned,
      'title': 'Revisi Tugas',
      'message': 'Tugas "UID Android Mobile Game" memerlukan revisi',
      'time': '1 minggu yang lalu',
      'course': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
      'isRead': true,
      'timeDetails': '2 Minggu Yang Lalu',
    },
    {
      'type': 'sistem',
      'icon': Icons.system_update,
      'title': 'Update Sistem',
      'message': 'Aplikasi LMS telah diperbarui ke versi 2.1.0',
      'time': '2 minggu yang lalu',
      'course': 'Sistem LMS',
      'isRead': true,
      'timeDetails': '3 Minggu Yang Lalu',
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
          'Notifikasi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B0000),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.checklist,
              color: Color(0xFF8B0000),
            ),
            onPressed: () {
              _markAllAsRead();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
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
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Notifikasi',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${notifications.length} Notifikasi',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8B0000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: notifications.any((n) => !n['isRead'])
                        ? const Color(0xFFFFEBEE)
                        : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: notifications.any((n) => !n['isRead'])
                          ? const Color(0xFFF44336)
                          : const Color(0xFF4CAF50),
                    ),
                  ),
                  child: Text(
                    notifications.any((n) => !n['isRead']) ? 'Belum Dibaca' : 'Semua Dibaca',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: notifications.any((n) => !n['isRead'])
                          ? const Color(0xFFF44336)
                          : const Color(0xFF4CAF50),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filter tab
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildFilterTab('Semua', true),
                ),
                Expanded(
                  child: _buildFilterTab('Belum Dibaca', false),
                ),
                Expanded(
                  child: _buildFilterTab('Tugas', false),
                ),
                Expanded(
                  child: _buildFilterTab('Kuis', false),
                ),
              ],
            ),
          ),

          // Daftar notifikasi
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationItem(notification, index);
              },
            ),
          ),
        ],
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

  // Widget untuk filter tab
  Widget _buildFilterTab(String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        // Aksi filter
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF8B0000).withOpacity(0.1) : Colors.transparent,
          border: isActive
              ? const Border(
                  bottom: BorderSide(
                    color: Color(0xFF8B0000),
                    width: 3,
                  ),
                )
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? const Color(0xFF8B0000) : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk item notifikasi
  Widget _buildNotificationItem(Map<String, dynamic> notification, int index) {
    Color iconColor;
    Color badgeColor;
    Color backgroundColor = notification['isRead'] ? Colors.white : const Color(0xFFF5F5F5);
    
    // Tentukan warna berdasarkan jenis notifikasi
    switch (notification['type']) {
      case 'tugas':
        iconColor = const Color(0xFF2196F3); // Biru
        badgeColor = const Color(0xFF2196F3);
        break;
      case 'kuis':
        iconColor = const Color(0xFF4CAF50); // Hijau
        badgeColor = const Color(0xFF4CAF50);
        break;
      case 'pengumuman':
        iconColor = const Color(0xFFFF9800); // Oranye
        badgeColor = const Color(0xFFFF9800);
        break;
      case 'sistem':
        iconColor = const Color(0xFF9C27B0); // Ungu
        badgeColor = const Color(0xFF9C27B0);
        break;
      default:
        iconColor = const Color(0xFF757575); // Abu-abu
        badgeColor = const Color(0xFF757575);
    }

    return GestureDetector(
      onTap: () {
        _markAsRead(index);
        _showNotificationDetail(notification);
      },
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikon dengan badge
            Stack(
              children: [
                // Ikon utama
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    notification['icon'],
                    color: iconColor,
                    size: 24,
                  ),
                ),
                // Badge belum dibaca
                if (!notification['isRead'])
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF44336),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            
            // Konten notifikasi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul dan badge jenis
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: badgeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: badgeColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          notification['title'].toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: badgeColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        notification['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  
                  // Mata kuliah
                  Text(
                    notification['course'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  
                  // Pesan notifikasi
                  Text(
                    notification['message'],
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.4,
                      fontWeight: notification['isRead'] ? FontWeight.normal : FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  
                  // Keterangan waktu detail
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Color(0xFF9E9E9E),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        notification['timeDetails'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const Spacer(),
                      if (notification['type'] == 'tugas')
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Color(0xFF9E9E9E),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menandai semua sebagai dibaca
  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification['isRead'] = true;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Semua notifikasi telah ditandai sebagai dibaca'),
        backgroundColor: Color(0xFF4CAF50),
      ),
    );
  }

  // Method untuk menandai satu notifikasi sebagai dibaca
  void _markAsRead(int index) {
    setState(() {
      notifications[index]['isRead'] = true;
    });
  }

  // Method untuk menampilkan detail notifikasi
  void _showNotificationDetail(Map<String, dynamic> notification) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header modal
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Header detail
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _getNotificationColor(notification['type']).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      notification['icon'],
                      color: _getNotificationColor(notification['type']),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          notification['course'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      // Opsi tambahan
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Divider
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              const SizedBox(height: 20),
              
              // Detail waktu
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: Color(0xFF9E9E9E),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Diterima:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      Text(
                        notification['timeDetails'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Isi pesan
              const Text(
                'Pesan:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                  ),
                ),
                child: Text(
                  notification['message'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),
              
              const Spacer(),
              
              // Tombol aksi
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleNotificationAction(notification);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getNotificationColor(notification['type']),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _getActionButtonText(notification['type']),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method untuk mendapatkan warna berdasarkan jenis notifikasi
  Color _getNotificationColor(String type) {
    switch (type) {
      case 'tugas':
        return const Color(0xFF2196F3);
      case 'kuis':
        return const Color(0xFF4CAF50);
      case 'pengumuman':
        return const Color(0xFFFF9800);
      case 'sistem':
        return const Color(0xFF9C27B0);
      default:
        return const Color(0xFF757575);
    }
  }

  // Helper method untuk mendapatkan teks tombol aksi
  String _getActionButtonText(String type) {
    switch (type) {
      case 'tugas':
        return 'Lihat Tugas';
      case 'kuis':
        return 'Lihat Kuis';
      case 'pengumuman':
        return 'Baca Pengumuman';
      case 'sistem':
        return 'Detail Update';
      default:
        return 'Lihat Detail';
    }
  }

  // Method untuk menangani aksi notifikasi
  void _handleNotificationAction(Map<String, dynamic> notification) {
    String message = '';
    
    switch (notification['type']) {
      case 'tugas':
        message = 'Membuka detail tugas "${notification['title']}"';
        // Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailPage(...)));
        break;
      case 'kuis':
        message = 'Membuka detail kuis "${notification['title']}"';
        // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(...)));
        break;
      case 'pengumuman':
        message = 'Membuka pengumuman "${notification['title']}"';
        // Navigator.push(context, MaterialPageRoute(builder: (context) => AnnouncementDetailPage(...)));
        break;
      default:
        message = 'Membuka notifikasi';
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _getNotificationColor(notification['type']),
      ),
    );
  }

  // Method untuk navigasi antar halaman
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
        // Sudah di halaman ini
        break;
    }
  }
}