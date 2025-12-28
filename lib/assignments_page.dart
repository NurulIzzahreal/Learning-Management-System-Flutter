import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';

class AssignmentsPage extends StatefulWidget {
  final String courseTitle;
  final String courseCode;

  const AssignmentsPage({
    super.key,
    required this.courseTitle,
    required this.courseCode,
  });

  @override
  _AssignmentsPageState createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1; // Kelas Saya aktif

  // Data tugas dan kuis
  final List<Map<String, dynamic>> assignments = [
    {
      'type': 'QUIZ',
      'icon': Icons.quiz,
      'title': 'Quiz Review 01 - UI Design Fundamentals',
      'isCompleted': true,
      'deadline': '15 Januari 2021 23:59 WIB',
      'description': 'Quiz tentang prinsip-prinsip dasar desain antarmuka',
      'totalQuestions': 10,
      'duration': '30 menit',
    },
    {
      'type': 'Tugas',
      'icon': Icons.assignment,
      'title': 'Tugas 01 - UID Android Mobile Game',
      'isCompleted': true,
      'deadline': '26 Februari 2021 23:59 WIB',
      'description': 'Desain UI/UX untuk aplikasi mobile game',
      'fileFormat': '.PDF',
      'maxSize': '5MB',
    },
    {
      'type': 'QUIZ',
      'icon': Icons.question_answer,
      'title': 'Quiz Interaksi Manusia-Komputer',
      'isCompleted': false,
      'deadline': '12 Maret 2021 23:59 WIB',
      'description': 'Quiz tentang konsep HCI dan usability',
      'totalQuestions': 15,
      'duration': '45 menit',
    },
    {
      'type': 'Tugas',
      'icon': Icons.assignment_turned_in,
      'title': 'Tugas 02 - Wireframe & Prototype',
      'isCompleted': false,
      'deadline': '2 April 2021 23:59 WIB',
      'description': 'Membuat wireframe dan prototype aplikasi',
      'fileFormat': '.Figma atau .XD',
      'maxSize': '10MB',
    },
    {
      'type': 'QUIZ',
      'icon': Icons.quiz,
      'title': 'Quiz Final Review - Desain Visual',
      'isCompleted': false,
      'deadline': '30 April 2021 23:59 WIB',
      'description': 'Quiz komprehensif tentang desain visual',
      'totalQuestions': 20,
      'duration': '60 menit',
    },
    {
      'type': 'Tugas',
      'icon': Icons.assignment_late,
      'title': 'Tugas Akhir - Desain Aplikasi Lengkap',
      'isCompleted': false,
      'deadline': '21 Mei 2021 23:59 WIB',
      'description': 'Proyek akhir desain aplikasi mobile lengkap',
      'fileFormat': '.PDF dan .Figma',
      'maxSize': '20MB',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1; // Default ke tab Tugas Dan Kuis
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.courseTitle.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.courseCode,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          indicatorWeight: 3,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          tabs: const [
            Tab(text: 'Materi'),
            Tab(text: 'Tugas Dan Kuis'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Materi (placeholder)
          _buildMaterialsPlaceholder(),
          
          // Tab 2: Tugas Dan Kuis
          _buildAssignmentsTab(),
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

  // Widget untuk tab Materi (placeholder)
  Widget _buildMaterialsPlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu_book,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          const Text(
            'Halaman Materi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Untuk melihat materi, silakan buka tab Materi di halaman utama kelas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman materi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Lihat Materi'),
          ),
        ],
      ),
    );
  }

  // Widget untuk tab Tugas Dan Kuis
  Widget _buildAssignmentsTab() {
    // Filter assignments berdasarkan type
    final List<Map<String, dynamic>> quizzes = assignments.where((a) => a['type'] == 'QUIZ').toList();
    final List<Map<String, dynamic>> tasks = assignments.where((a) => a['type'] == 'Tugas').toList();
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Statistik ringkasan
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total', '${assignments.length}', Icons.list_alt),
                _buildStatItem('Selesai', '${assignments.where((a) => a['isCompleted']).length}', Icons.check_circle),
                _buildStatItem('Tertunda', '${assignments.where((a) => !a['isCompleted']).length}', Icons.access_time),
              ],
            ),
          ),

          // Section: Quiz
          if (quizzes.isNotEmpty) ...[
            const Text(
              'Quiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizzes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _buildAssignmentCard(quizzes[index]);
              },
            ),
            const SizedBox(height: 24),
          ],

          // Section: Tugas
          if (tasks.isNotEmpty) ...[
            const Text(
              'Tugas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _buildAssignmentCard(tasks[index]);
              },
            ),
            const SizedBox(height: 20),
          ],

          // Info tenggat waktu
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFFFFB74D),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Color(0xFFF57C00),
                  size: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Pastikan untuk mengumpulkan tugas sebelum tenggat waktu. Keterlambatan pengumpulan akan mengurangi nilai.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFF57C00),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Widget untuk stat item
  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF8B0000).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF8B0000),
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8B0000),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Widget untuk card tugas/kuis
  Widget _buildAssignmentCard(Map<String, dynamic> assignment) {
    return GestureDetector(
      onTap: () {
        _showAssignmentDetail(assignment);
      },
      child: Container(
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
            color: assignment['isCompleted'] 
                ? const Color(0xFF4CAF50).withOpacity(0.3)
                : const Color(0xFFE0E0E0),
            width: assignment['isCompleted'] ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan badge dan status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge type (biru)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    assignment['type'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // Status penyelesaian
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: assignment['isCompleted'] 
                        ? const Color(0xFF4CAF50).withOpacity(0.1)
                        : const Color(0xFFF5F5F5),
                    border: Border.all(
                      color: assignment['isCompleted']
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFBDBDBD),
                      width: 1.5,
                    ),
                  ),
                  child: assignment['isCompleted']
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Color(0xFF4CAF50),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Ikon dan judul
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ikon
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: assignment['type'] == 'QUIZ'
                        ? const Color(0xFFE3F2FD)
                        : const Color(0xFFE8EAF6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    assignment['icon'],
                    color: assignment['type'] == 'QUIZ'
                        ? const Color(0xFF1976D2)
                        : const Color(0xFF3F51B5),
                    size: 20,
                  ),
                ),
                
                // Judul dan deskripsi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul
                      Text(
                        assignment['title'],
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
                      
                      // Deskripsi
                      Text(
                        assignment['description'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF616161),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Informasi detail (tergantung type)
            if (assignment['type'] == 'QUIZ') ...[
              Row(
                children: [
                  _buildDetailItem(Icons.format_list_numbered, '${assignment['totalQuestions']} Soal'),
                  const SizedBox(width: 16),
                  _buildDetailItem(Icons.timer, assignment['duration']),
                ],
              ),
            ] else if (assignment['type'] == 'Tugas') ...[
              Row(
                children: [
                  _buildDetailItem(Icons.insert_drive_file, assignment['fileFormat']),
                  const SizedBox(width: 16),
                  _buildDetailItem(Icons.storage, assignment['maxSize']),
                ],
              ),
            ],
            
            const SizedBox(height: 12),
            
            // Tenggat waktu
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Color(0xFFF44336),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tenggat Waktu:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFF44336),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          assignment['deadline'],
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF616161),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!assignment['isCompleted'])
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEBEE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'PENTING',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFFF44336),
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
    );
  }

  // Widget untuk detail item
  Widget _buildDetailItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: const Color(0xFF757575),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }

  // Method untuk menampilkan detail tugas/kuis
  void _showAssignmentDetail(Map<String, dynamic> assignment) {
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
          height: MediaQuery.of(context).size.height * 0.85,
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
              
              // Badge dan status
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      assignment['type'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (assignment['isCompleted'])
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF4CAF50),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Color(0xFF4CAF50),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Selesai',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4CAF50),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Judul
              Text(
                assignment['title'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              
              // Deskripsi
              Text(
                assignment['description'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              
              // Informasi detail
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    if (assignment['type'] == 'QUIZ') ...[
                      _buildDetailRow('Jumlah Soal', '${assignment['totalQuestions']} Soal'),
                      _buildDetailRow('Durasi', assignment['duration']),
                    ] else if (assignment['type'] == 'Tugas') ...[
                      _buildDetailRow('Format File', assignment['fileFormat']),
                      _buildDetailRow('Ukuran Maksimal', assignment['maxSize']),
                    ],
                    _buildDetailRow('Tenggat Waktu', assignment['deadline']),
                    _buildDetailRow(
                      'Status', 
                      assignment['isCompleted'] ? 'Telah Dikumpulkan' : 'Belum Dikumpulkan',
                      isImportant: !assignment['isCompleted'],
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Tombol aksi
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF8B0000)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8B0000),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              assignment['isCompleted'] 
                                ? 'Melihat ${assignment['title']}' 
                                : 'Membuka ${assignment['title']}',
                            ),
                            backgroundColor: const Color(0xFF8B0000),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B0000),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        assignment['isCompleted'] ? 'Lihat Hasil' : 'Kerjakan',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget untuk baris detail
  Widget _buildDetailRow(String label, String value, {bool isImportant = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15,
              color: isImportant ? const Color(0xFFF44336) : Colors.black87,
              fontWeight: isImportant ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      )
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