import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  final String taskTitle;
  final String courseName;

  const TaskDetailPage({
    super.key,
    required this.taskTitle,
    required this.courseName,
  });

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  // Data status tugas
  Map<String, String> taskStatus = {
    'Status': 'Sudah Mengirim untuk dinilai',
    'Status Nilai': 'Belum Dinilai',
    'Batas Tanggal': 'Rabu, 26 Mei 2021 - 23:59',
    'Sisa Waktu': 'Telah dikirim (26 Mei 2021 - 14:30)',
    'File Tugas': 'Tugas01_UIDMobileGame.pdf',
  };

  // Daftar instruksi tugas
  final List<String> instructions = [
    'Desain UI/UX untuk aplikasi mobile game dengan tema bebas',
    'Gunakan Figma, Adobe XD, atau Sketch sebagai tools',
    'Sertakan minimal 5 halaman/screen yang berbeda',
    'Tambahkan interaksi dan prototipe sederhana',
    'Format file: .PDF',
    'Batas ukuran file: 5MB',
    'Tenggat waktu: 26 Mei 2021 - 23:59'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header merah marun
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            color: const Color(0xFF8B0000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tombol kembali
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.taskTitle,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.courseName,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Konten utama (scrollable)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card: Instruksi Tugas
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 20),
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
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instruksi Tugas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B0000),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Silakan kerjakan tugas berikut sesuai dengan petunjuk di bawah ini:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...instructions.asMap().entries.map((entry) {
                          int index = entry.key + 1;
                          String instruction = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 12, top: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8B0000),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$index',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    instruction,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: const Color(0xFF8B0000).withOpacity(0.2),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Color(0xFF8B0000),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Pastikan untuk mengumpulkan sebelum tenggat waktu. Keterlambatan pengumpulan akan mengurangi nilai.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF8B0000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Card: Status Tugas
                  Container(
                    width: double.infinity,
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
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header tabel (merah muda/salmon)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFCDD2),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            border: Border.all(
                              color: const Color(0xFF8B0000).withOpacity(0.2),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.assignment_turned_in,
                                color: Color(0xFF8B0000),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Status Tugas',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8B0000),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Isi tabel dengan zebra striping
                        ...taskStatus.entries.map((entry) {
                          int index = taskStatus.keys.toList().indexOf(entry.key);
                          bool isEven = index % 2 == 0;
                          
                          return Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isEven ? Colors.grey[50] : Colors.white,
                              border: Border(
                                bottom: index < taskStatus.length - 1
                                    ? BorderSide(
                                        color: Colors.grey.withOpacity(0.1),
                                        width: 1,
                                      )
                                    : BorderSide.none,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    '${entry.key}:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _buildStatusValue(entry.key, entry.value),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tombol Tambahkan Tugas
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAddTaskDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle_outline,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Tambahkan Tugas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan nilai status dengan styling khusus
  Widget _buildStatusValue(String key, String value) {
    switch (key) {
      case 'Status':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xFF4CAF50).withOpacity(0.3),
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      
      case 'Status Nilai':
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEE),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xFFF44336).withOpacity(0.3),
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFD32F2F),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      
      case 'File Tugas':
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.picture_as_pdf,
                color: Color(0xFF8B0000),
                size: 24,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '2.4 MB • Dikirim 26 Mei 2021',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.download,
                  color: Color(0xFF8B0000),
                  size: 20,
                ),
                onPressed: () {
                  // Action untuk download file
                },
              ),
            ],
          ),
        );
      
      default:
        return Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        );
    }
  }

  // Dialog untuk menambahkan tugas
  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Tambahkan Tugas',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Pilih file tugas yang akan diunggah:'),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      color: Color(0xFF8B0000),
                      size: 40,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Klik untuk memilih file',
                      style: TextStyle(
                        color: Color(0xFF8B0000),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Format: .PDF (Maks. 5MB)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Atau seret file ke sini',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tugas berhasil ditambahkan!'),
                  backgroundColor: Color(0xFF8B0000),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Unggah'),
          ),
        ],
      ),
    );
  }
}