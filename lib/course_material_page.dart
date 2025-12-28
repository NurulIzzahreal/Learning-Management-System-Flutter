import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';
import 'assignments_page.dart';

class CourseMaterialPage extends StatefulWidget {
  final String courseTitle;
  final String courseCode;

  const CourseMaterialPage({
    super.key,
    required this.courseTitle,
    required this.courseCode,
  });

  @override
  _CourseMaterialPageState createState() => _CourseMaterialPageState();
}

class _CourseMaterialPageState extends State<CourseMaterialPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1; // Kelas Saya aktif

  // Data materi kuliah
  final List<Map<String, dynamic>> materials = [
    {
      'session': 'Pertemuan 1',
      'title': '01 - Pengantar User Interface Design',
      'isCompleted': true,
      'resources': '3 URLs, 2 Files, 3 Interactive Content',
      'date': '15 Januari 2021',
    },
    {
      'session': 'Pertemuan 2',
      'title': '02 - Prinsip-Prinsip Desain Visual',
      'isCompleted': true,
      'resources': '2 URLs, 3 Files, 2 Interactive Content',
      'date': '22 Januari 2021',
    },
    {
      'session': 'Pertemuan 3',
      'title': '03 - User Experience Fundamentals',
      'isCompleted': true,
      'resources': '4 URLs, 1 File, 4 Interactive Content',
      'date': '29 Januari 2021',
    },
    {
      'session': 'Pertemuan 4',
      'title': '04 - Wireframing dan Prototyping',
      'isCompleted': false,
      'resources': '2 URLs, 5 Files, 3 Interactive Content',
      'date': '5 Februari 2021',
    },
    {
      'session': 'Pertemuan 5',
      'title': '05 - Design System dan Style Guide',
      'isCompleted': false,
      'resources': '3 URLs, 4 Files, 2 Interactive Content',
      'date': '12 Februari 2021',
    },
    {
      'session': 'Pertemuan 6',
      'title': '06 - Usability Testing Methods',
      'isCompleted': false,
      'resources': '1 URL, 3 Files, 5 Interactive Content',
      'date': '19 Februari 2021',
    },
    {
      'session': 'Pertemuan 7',
      'title': '07 - Mobile App Design Patterns',
      'isCompleted': false,
      'resources': '2 URLs, 6 Files, 3 Interactive Content',
      'date': '26 Februari 2021',
    },
    {
      'session': 'Pertemuan 8',
      'title': '08 - Responsive Web Design',
      'isCompleted': false,
      'resources': '3 URLs, 2 Files, 4 Interactive Content',
      'date': '5 Maret 2021',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
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
              style: const TextStyle(fontSize: 12, color: Colors.white70),
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
          // Tab 1: Materi
          _buildMaterialsTab(),

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

  // Widget untuk tab Materi
  Widget _buildMaterialsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Progress info
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
              children: [
                // Progress circle
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 3 / 8, // 3 dari 8 materi selesai
                        strokeWidth: 6,
                        backgroundColor: const Color(0xFFE0E0E0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF8B0000),
                        ),
                      ),
                    ),
                    const Text(
                      '3/8',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B0000),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Progress Pembelajaran',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${(3 / 8 * 100).toStringAsFixed(0)}% materi telah diselesaikan',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 3 / 8,
                        backgroundColor: const Color(0xFFE0E0E0),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF8B0000),
                        ),
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Daftar materi
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: materials.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final material = materials[index];
              return _buildMaterialCard(material, index);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget untuk tab Tugas Dan Kuis
  Widget _buildAssignmentsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 20),
          const Text(
            'Tugas dan Kuis',
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
              'Klik tombol di bawah untuk melihat tugas dan kuis',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssignmentsPage(
                    courseTitle: widget.courseTitle,
                    courseCode: widget.courseCode,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Lihat Tugas & Kuis'),
          ),
        ],
      ),
    );
  }

  // Widget untuk card materi
  Widget _buildMaterialCard(Map<String, dynamic> material, int index) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail materi
        _showMaterialDetail(material);
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
            color: material['isCompleted']
                ? const Color(0xFF4CAF50).withOpacity(0.3)
                : const Color(0xFFE0E0E0),
            width: material['isCompleted'] ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge sesi (biru)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    material['session'],
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
                    color: material['isCompleted']
                        ? const Color(0xFF4CAF50).withOpacity(0.1)
                        : const Color(0xFFE0E0E0),
                    border: Border.all(
                      color: material['isCompleted']
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFBDBDBD),
                      width: 1.5,
                    ),
                  ),
                  child: material['isCompleted']
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

            // Judul materi
            Text(
              material['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),

            // Tanggal
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Color(0xFF9E9E9E),
                ),
                const SizedBox(width: 6),
                Text(
                  material['date'],
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Detail resource
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.folder_open,
                    size: 16,
                    color: Color(0xFF2196F3),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      material['resources'],
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF616161),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: Color(0xFF9E9E9E),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk menampilkan detail materi
  void _showMaterialDetail(Map<String, dynamic> material) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.8,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      material['session'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (material['isCompleted'])
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF4CAF50)),
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

              // Judul materi
              Text(
                material['title'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Tanggal
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Color(0xFF9E9E9E),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    material['date'],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Divider
              Container(height: 1, color: Colors.grey.withOpacity(0.2)),
              const SizedBox(height: 20),

              // Konten materi
              const Text(
                'Konten Materi:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              const SizedBox(height: 15),

              Expanded(
                child: ListView(
                  children: [
                    _buildResourceItem(
                      'Video Pembelajaran',
                      Icons.videocam,
                      '45 menit',
                    ),
                    _buildResourceItem(
                      'Slide Presentasi',
                      Icons.slideshow,
                      'PDF - 25 slide',
                    ),
                    _buildResourceItem(
                      'Reading Materials',
                      Icons.article,
                      '3 artikel',
                    ),
                    _buildResourceItem('Quiz', Icons.quiz, '10 soal'),
                    _buildResourceItem(
                      'Diskusi',
                      Icons.forum,
                      'Forum diskusi online',
                    ),
                  ],
                ),
              ),

              // Tombol aksi
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Membuka ${material['title']}'),
                        backgroundColor: const Color(0xFF8B0000),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Buka Materi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget untuk item resource
  Widget _buildResourceItem(String title, IconData icon, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF8B0000).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF8B0000), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
        ],
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
