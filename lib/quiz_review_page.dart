import 'package:flutter/material.dart';

class QuizReviewPage extends StatefulWidget {
  final Map<String, dynamic> quizResult;

  const QuizReviewPage({
    super.key,
    required this.quizResult,
  });

  @override
  _QuizReviewPageState createState() => _QuizReviewPageState();
}

class _QuizReviewPageState extends State<QuizReviewPage> {
  // Data dummy untuk review jawaban
  final List<Map<String, dynamic>> questionReviews = [
    {
      'question': 'Apa yang dimaksud dengan User Interface (UI) Design?',
      'userAnswer': 'A. Proses merancang tampilan visual aplikasi',
      'correctAnswer': 'A. Proses merancang tampilan visual aplikasi',
      'isCorrect': true,
      'explanation': 'UI Design berfokus pada aspek visual dan interaktif aplikasi.',
    },
    {
      'question': 'Prinsip apa yang paling penting dalam UX Design?',
      'userAnswer': 'C. Kemudahan penggunaan',
      'correctAnswer': 'C. Kemudahan penggunaan',
      'isCorrect': true,
      'explanation': 'Usability adalah prinsip utama dalam pengalaman pengguna.',
    },
    {
      'question': 'Apa tujuan utama dari usability testing?',
      'userAnswer': 'B. Mengurangi ukuran file',
      'correctAnswer': 'C. Mengidentifikasi masalah pengguna',
      'isCorrect': false,
      'explanation': 'Usability testing bertujuan menemukan masalah yang dihadapi pengguna saat menggunakan produk.',
    },
    {
      'question': 'Apa yang dimaksud dengan wireframe dalam desain UI?',
      'userAnswer': 'C. Sketsa layout dasar',
      'correctAnswer': 'C. Sketsa layout dasar',
      'isCorrect': true,
      'explanation': 'Wireframe adalah kerangka dasar yang menunjukkan struktur dan layout.',
    },
    {
      'question': 'Warna apa yang sering diasosiasikan dengan peringatan?',
      'userAnswer': 'C. Kuning',
      'correctAnswer': 'C. Kuning',
      'isCorrect': true,
      'explanation': 'Warna kuning umumnya digunakan untuk menunjukkan peringatan atau hati-hati.',
    },
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
            child: Row(
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
                Expanded(
                  child: Text(
                    'Review Jawaban',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 48), // Untuk balance dengan back button
              ],
            ),
          ),

          // Ringkasan status
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                // Header ringkasan
                Row(
                  children: [
                    const Icon(
                      Icons.analytics,
                      color: Color(0xFF8B0000),
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Ringkasan Kuis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8B0000),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF4CAF50),
                        ),
                      ),
                      child: const Text(
                        'SELESAI',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4CAF50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Grid informasi
                Row(
                  children: [
                    // Kolom kiri: Waktu
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoItem('Di Mulai Pada', 'Senin, 15 Jan 2021 14:30 WIB'),
                          const SizedBox(height: 12),
                          _buildInfoItem('Selesai Pada', 'Senin, 15 Jan 2021 15:15 WIB'),
                          const SizedBox(height: 12),
                          _buildInfoItem('Waktu Penyelesaian', '45 menit 30 detik'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    
                    // Kolom kanan: Hasil
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoItem('Status', 'Selesai'),
                          const SizedBox(height: 12),
                          _buildInfoItem('Skor', '80 / 100'),
                          const SizedBox(height: 12),
                          _buildInfoItem('Persentase', '80%'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Performa Jawaban:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '${questionReviews.where((q) => q['isCorrect']).length} Benar / ${questionReviews.length} Soal',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B0000),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: questionReviews.where((q) => q['isCorrect']).length / questionReviews.length,
                  backgroundColor: const Color(0xFFE0E0E0),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),

          // Daftar review pertanyaan
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Review Jawaban:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B0000),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  ...questionReviews.asMap().entries.map((entry) {
                    int index = entry.key + 1;
                    Map<String, dynamic> review = entry.value;
                    
                    return _buildQuestionReviewCard(review, index);
                  }).toList(),
                  
                  const SizedBox(height: 80), // Spacer untuk tombol
                ],
              ),
            ),
          ),
        ],
      ),
      
      // Tombol Kirim Jawaban (sticky bottom)
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              _submitFinalAnswers();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50), // Hijau terang
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 12),
                Text(
                  'Kirim Jawaban',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk item info
  Widget _buildInfoItem(String label, String value) {
    return Column(
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
    );
  }

  // Widget untuk card review pertanyaan
  Widget _buildQuestionReviewCard(Map<String, dynamic> review, int questionNumber) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: review['isCorrect']
              ? const Color(0xFFE8F5E9)
              : const Color(0xFFFFEBEE),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan nomor dan status
            Row(
              children: [
                // Nomor soal
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2196F3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$questionNumber',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Label Pertanyaan
                const Text(
                  'Pertanyaan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                
                const Spacer(),
                
                // Status benar/salah
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: review['isCorrect']
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: review['isCorrect']
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFF44336),
                    ),
                  ),
                  child: Text(
                    review['isCorrect'] ? 'BENAR' : 'SALAH',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: review['isCorrect']
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFF44336),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Kotak teks pertanyaan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFEEEEEE),
                ),
              ),
              child: Text(
                review['question'],
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Detail jawaban
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jawaban Tersimpan:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: review['isCorrect']
                        ? const Color(0xFFE8F5E9)
                        : const Color(0xFFFFEBEE),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: review['isCorrect']
                          ? const Color(0xFFC8E6C9)
                          : const Color(0xFFFFCDD2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        review['isCorrect']
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: review['isCorrect']
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFFF44336),
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          review['userAnswer'],
                          style: TextStyle(
                            fontSize: 15,
                            color: review['isCorrect']
                                ? const Color(0xFF2E7D32)
                                : const Color(0xFFD32F2F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Jawaban yang benar (jika salah)
                if (!review['isCorrect']) ...[
                  const SizedBox(height: 12),
                  const Text(
                    'Jawaban yang Benar:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFC8E6C9),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF4CAF50),
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            review['correctAnswer'],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                
                // Penjelasan
                const SizedBox(height: 12),
                const Text(
                  'Penjelasan:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFBBDEFB),
                    ),
                  ),
                  child: Text(
                    review['explanation'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1565C0),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Tautan Lihat Soal
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _showQuestionDetail(review, questionNumber);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lihat Soal',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.visibility,
                      color: Color(0xFF2196F3),
                      size: 16,
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

  // Method untuk menampilkan detail soal
  void _showQuestionDetail(Map<String, dynamic> review, int questionNumber) {
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
              
              // Nomor soal
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2196F3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$questionNumber',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Detail Soal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: review['isCorrect']
                          ? const Color(0xFFE8F5E9)
                          : const Color(0xFFFFEBEE),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: review['isCorrect']
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFFF44336),
                      ),
                    ),
                    child: Text(
                      review['isCorrect'] ? 'BENAR' : 'SALAH',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: review['isCorrect']
                            ? const Color(0xFF4CAF50)
                            : const Color(0xFFF44336),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Pertanyaan
              const Text(
                'Pertanyaan:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFEEEEEE),
                  ),
                ),
                child: Text(
                  review['question'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Pilihan jawaban
              const Text(
                'Pilihan Jawaban:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView(
                  children: [
                    _buildAnswerOption('A. Proses merancang tampilan visual aplikasi', review['userAnswer'], review['correctAnswer']),
                    _buildAnswerOption('B. Studi tentang interaksi manusia-komputer', review['userAnswer'], review['correctAnswer']),
                    _buildAnswerOption('C. Teknik pemrograman backend', review['userAnswer'], review['correctAnswer']),
                    _buildAnswerOption('D. Analisis kebutuhan pengguna', review['userAnswer'], review['correctAnswer']),
                    _buildAnswerOption('E. Pengujian fungsionalitas sistem', review['userAnswer'], review['correctAnswer']),
                  ],
                ),
              ),
              
              // Tombol tutup
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Tutup',
                    style: TextStyle(
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

  // Widget untuk pilihan jawaban dalam modal
  Widget _buildAnswerOption(String option, String userAnswer, String correctAnswer) {
    bool isUserAnswer = option == userAnswer;
    bool isCorrectAnswer = option == correctAnswer;
    
    Color backgroundColor = Colors.white;
    Color borderColor = const Color(0xFFE0E0E0);
    Color textColor = Colors.black87;
    
    if (isUserAnswer && isCorrectAnswer) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF4CAF50);
      textColor = const Color(0xFF2E7D32);
    } else if (isUserAnswer && !isCorrectAnswer) {
      backgroundColor = const Color(0xFFFFEBEE);
      borderColor = const Color(0xFFF44336);
      textColor = const Color(0xFFD32F2F);
    } else if (!isUserAnswer && isCorrectAnswer) {
      backgroundColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF4CAF50);
      textColor = const Color(0xFF2E7D32);
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isUserAnswer || isCorrectAnswer ? borderColor : const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
              border: Border.all(
                color: isUserAnswer || isCorrectAnswer ? borderColor : const Color(0xFFE0E0E0),
              ),
            ),
            child: Center(
              child: Text(
                option.substring(0, 1), // A, B, C, D, E
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isUserAnswer || isCorrectAnswer ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              option,
              style: TextStyle(
                fontSize: 15,
                color: textColor,
                fontWeight: isUserAnswer || isCorrectAnswer ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (isUserAnswer)
            const Icon(
              Icons.person,
              color: Color(0xFF2196F3),
              size: 20,
            ),
          if (isCorrectAnswer && !isUserAnswer)
            const Icon(
              Icons.check,
              color: Color(0xFF4CAF50),
              size: 20,
            ),
        ],
      ),
    );
  }

  // Method untuk mengirim jawaban final
  void _submitFinalAnswers() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Konfirmasi Pengiriman',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_amber,
              color: Color(0xFFFF9800),
              size: 50,
            ),
            SizedBox(height: 16),
            Text(
              'Apakah Anda yakin ingin mengirim jawaban final? '
              'Jawaban tidak dapat diubah setelah dikirim.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ],
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
              _showSubmissionSuccess();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
            ),
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }

  // Method untuk menampilkan sukses pengiriman
  void _showSubmissionSuccess() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Jawaban Terkirim!',
          style: TextStyle(
            color: Color(0xFF4CAF50),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Color(0xFF4CAF50),
              size: 60,
            ),
            const SizedBox(height: 20),
            const Text(
              'Jawaban kuis telah berhasil dikirim dan disimpan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Nilai: 80/100',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Kembali ke Beranda'),
          ),
        ],
      ),
    );
  }
}