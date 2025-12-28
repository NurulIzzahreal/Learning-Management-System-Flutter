import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_classes_page.dart';
import 'login_page.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({super.key});

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // Default Home
  int _activeTab = 0; // 0: About Me, 1: Kelas, 2: Edit Profile

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      body: Column(
        children: [
          // Header dengan background merah marun melengkung
          Stack(
            children: [
              // Background merah marun dengan kurva
              Container(
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF8B0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              
              // Tombol kembali
              Positioned(
                top: 50,
                left: 16,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              
              // Foto profil dan nama
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // Foto profil lingkaran
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/student_profile.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.person,
                                color: Color(0xFF8B0000),
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Nama mahasiswa
                    const Text(
                      'NURUL IZZAH',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    
                    // Status mahasiswa
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Mahasiswa Aktif',
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
            ],
          ),
          
          // Floating tab card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                // Tab About Me
                Expanded(
                  child: _buildTabItem('About Me', 0),
                ),
                // Tab Kelas
                Expanded(
                  child: _buildTabItem('Kelas', 1),
                ),
                // Tab Edit Profile
                Expanded(
                  child: _buildTabItem('Edit Profile', 2),
                ),
              ],
            ),
          ),
          
          // Konten berdasarkan tab aktif
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildTabContent(),
            ),
          ),
          
          // Tombol Logout
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutConfirmation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F), // Merah gelap
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
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

  // Widget untuk item tab
  Widget _buildTabItem(String title, int index) {
    bool isActive = _activeTab == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF8B0000).withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? const Color(0xFF8B0000) : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            if (isActive)
              Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B0000),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Widget untuk konten tab
  Widget _buildTabContent() {
    switch (_activeTab) {
      case 0: // About Me
        return _buildAboutMeContent();
      case 1: // Kelas
        return _buildClassesContent();
      case 2: // Edit Profile
        return _buildEditProfileContent();
      default:
        return _buildAboutMeContent();
    }
  }

  // Konten untuk tab About Me
  Widget _buildAboutMeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Informasi User
        _buildSectionTitle('Informasi User'),
        const SizedBox(height: 16),
        _buildInfoCard([
          _buildInfoItem('Nama Lengkap', 'Nurul Izzah'),
          _buildInfoItem('NIM', '2022020100025'),
          _buildInfoItem('Email Address', 'nurul.izzah@student.celoe.ac.id'),
          _buildInfoItem('Program Studi', 'S1 Teknik Informatika'),
          _buildInfoItem('Fakultas', 'Fakultas Teknik (FT)'),
          _buildInfoItem('Angkatan', '2022'),
          _buildInfoItem('Semester', '7 (Tujuh)'),
        ]),
        const SizedBox(height: 24),
        
        // Kontak & Sosial Media
        _buildSectionTitle('Kontak & Sosial Media'),
        const SizedBox(height: 16),
        _buildInfoCard([
          _buildInfoItemWithIcon(Icons.phone, 'Telepon', '+62 812 3456 7890'),
          _buildInfoItemWithIcon(Icons.location_on, 'Alamat', 'Jl. Pendidikan No. 123, Jakarta Selatan'),
          _buildInfoItemWithIcon(Icons.link, 'LinkedIn', 'linkedin.com/in/nurulizzah'),
          _buildInfoItemWithIcon(Icons.public, 'Website', 'nurulizzah.myportfolio.com'),
        ]),
        const SizedBox(height: 24),
        
        // Aktivitas Login
        _buildSectionTitle('Aktivitas Login'),
        const SizedBox(height: 16),
        _buildInfoCard([
          _buildInfoItem('First access to site', 'Senin, 10 Januari 2021 08:30 WIB'),
          _buildInfoItem('Last access to site', 'Kamis, 20 Mei 2021 14:45 WIB'),
          _buildInfoItem('Total Login', '128 kali'),
        ]),
        const SizedBox(height: 24),
        
        // Prestasi & Pencapaian
        _buildSectionTitle('Prestasi & Pencapaian'),
        const SizedBox(height: 16),
        _buildAchievementCard(),
        const SizedBox(height: 40),
      ],
    );
  }

  // Konten untuk tab Kelas
  Widget _buildClassesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Kelas yang Diikuti'),
        const SizedBox(height: 16),
        
        // Statistik kelas
        Container(
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
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Total', '7', Icons.school),
              _buildStatItem('Selesai', '3', Icons.check_circle),
              _buildStatItem('Berjalan', '4', Icons.access_time),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        // Daftar kelas aktif
        _buildSectionTitle('Kelas Aktif Semester Ini'),
        const SizedBox(height: 12),
        _buildClassCard('DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', 'D4SM-42-03 [ADY]', 0.89),
        _buildClassCard('KEWARGANEGARAAN', 'D4SM-41-GAB1 [BBO] JUMAT 2', 0.26),
        _buildClassCard('SISTEM OPERASI', 'D4SM-44-02 [DDS]', 0.90),
        _buildClassCard('PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 'D4SM-41-GAB1 [APJ]', 0.90),
        
        const SizedBox(height: 20),
        
        // Riwayat kelas
        _buildSectionTitle('Riwayat Kelas'),
        const SizedBox(height: 12),
        _buildCompletedClassCard('ALGORITMA PEMROGRAMAN', 'Semester 1 - 2019', true),
        _buildCompletedClassCard('BASIS DATA', 'Semester 2 - 2020', true),
        _buildCompletedClassCard('JARINGAN KOMPUTER', 'Semester 3 - 2020', true),
        
        const SizedBox(height: 40),
      ],
    );
  }

  // Konten untuk tab Edit Profile
  Widget _buildEditProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Edit Profil'),
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(20),
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
          child: Column(
            children: [
              // Foto profil
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B0000).withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF8B0000),
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF8B0000),
                      size: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B0000),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Ubah Foto',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B0000),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              
              // Form edit
              _buildEditFormField('Nama Lengkap', 'Nurul Izzah'),
              const SizedBox(height: 16),
              _buildEditFormField('Email', 'nurul.izzah@student.celoe.ac.id'),
              const SizedBox(height: 16),
              _buildEditFormField('Telepon', '+62 812 3456 7890'),
              const SizedBox(height: 16),
              _buildEditFormField('Alamat', 'Jl. Pendidikan No. 123, Jakarta Selatan'),
              const SizedBox(height: 24),
              
              // Tombol simpan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _showSaveConfirmation();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  // Widget untuk judul section
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF8B0000),
      ),
    );
  }

  // Widget untuk card informasi
  Widget _buildInfoCard(List<Widget> children) {
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  // Widget untuk item informasi
  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF757575),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk item informasi dengan icon
  Widget _buildInfoItemWithIcon(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xFF8B0000),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF757575),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk card prestasi
  Widget _buildAchievementCard() {
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
      ),
      child: Column(
        children: [
          _buildAchievementItem('Juara 1 Lomba UI/UX Design', 'Festival Teknologi 2020'),
          const SizedBox(height: 12),
          _buildAchievementItem('Finalis Kompetisi Programming', 'National IT Contest 2021'),
          const SizedBox(height: 12),
          _buildAchievementItem('Sertifikasi Adobe Certified Expert', 'UI/UX Design Specialist'),
        ],
      ),
    );
  }

  // Widget untuk item prestasi
  Widget _buildAchievementItem(String title, String description) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF8B0000).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.emoji_events,
            color: Color(0xFF8B0000),
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
      ],
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

  // Widget untuk card kelas
  Widget _buildClassCard(String title, String code, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
          color: const Color(0xFFE0E0E0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            code,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF757575),
            ),
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: const Color(0xFFE0E0E0),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B0000)),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(progress * 100).toInt()}% Selesai',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Color(0xFF757575),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk card kelas selesai
  Widget _buildCompletedClassCard(String title, String semester, bool isPassed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
          color: isPassed ? const Color(0xFFC8E6C9) : const Color(0xFFFFCDD2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPassed 
                  ? const Color(0xFFE8F5E9)
                  : const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isPassed ? Icons.check_circle : Icons.school,
              color: isPassed 
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFFF44336),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  semester,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPassed 
                  ? const Color(0xFFE8F5E9)
                  : const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isPassed 
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFFF44336),
              ),
            ),
            child: Text(
              isPassed ? 'LULUS' : 'TIDAK LULUS',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isPassed 
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFFF44336),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk form field edit
  Widget _buildEditFormField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF616161),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF8B0000), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
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

  // Method untuk konfirmasi logout
  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Konfirmasi Logout',
          style: TextStyle(
            color: Color(0xFFD32F2F),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari akun ini?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Batal',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  // Method untuk konfirmasi simpan
  void _showSaveConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil berhasil diperbarui!'),
        backgroundColor: Color(0xFF4CAF50),
      ),
    );
    
    // Kembali ke tab About Me
    setState(() {
      _activeTab = 0;
    });
  }
}