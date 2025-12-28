import 'package:flutter/material.dart';
import 'dart:async'; // Untuk Timer

class QuizPage extends StatefulWidget {
  final String quizTitle;
  final int totalQuestions;

  const QuizPage({
    super.key,
    required this.quizTitle,
    required this.totalQuestions,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  List<int?> _userAnswers = List.filled(15, null);
  List<bool> _answeredQuestions = List.filled(15, false);
  int _secondsRemaining = 1800; // 30 menit dalam detik
  late Timer _timer;

  // Data dummy untuk soal kuis
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa yang dimaksud dengan User Interface (UI) Design?',
      'options': [
        'A. Proses merancang tampilan visual aplikasi',
        'B. Studi tentang interaksi manusia-komputer',
        'C. Teknik pemrograman backend',
        'D. Analisis kebutuhan pengguna',
        'E. Pengujian fungsionalitas sistem',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Prinsip apa yang paling penting dalam UX Design?',
      'options': [
        'A. Estetika visual',
        'B. Kecepatan loading',
        'C. Kemudahan penggunaan',
        'D. Kompleksitas fitur',
        'E. Warna yang menarik',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Apa tujuan utama dari usability testing?',
      'options': [
        'A. Meningkatkan kecepatan aplikasi',
        'B. Mengurangi ukuran file',
        'C. Mengidentifikasi masalah pengguna',
        'D. Menambah fitur baru',
        'E. Memperbaiki warna tema',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Apa yang dimaksud dengan wireframe dalam desain UI?',
      'options': [
        'A. Gambar akhir produk',
        'B. Prototipe interaktif',
        'C. Sketsa layout dasar',
        'D. Kode program',
        'E. Dokumentasi teknis',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Warna apa yang sering diasosiasikan dengan peringatan?',
      'options': [
        'A. Biru',
        'B. Hijau',
        'C. Kuning',
        'D. Ungu',
        'E. Putih',
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Apa itu design system?',
      'options': [
        'A. Kumpulan komponen UI yang konsisten',
        'B. Software untuk desain grafis',
        'C. Metode pengujian pengguna',
        'D. Teknik animasi UI',
        'E. Template website',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa fungsi dari breadcrumb navigation?',
      'options': [
        'A. Menunjukkan posisi user dalam hierarki',
        'B. Mempercepat loading halaman',
        'C. Menyimpan data pengguna',
        'D. Mengenkripsi informasi',
        'E. Menampilkan iklan',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa yang dimaksud dengan responsive design?',
      'options': [
        'A. Desain yang cepat loading',
        'B. Desain yang beradaptasi dengan ukuran layar',
        'C. Desain dengan banyak animasi',
        'D. Desain dengan warna cerah',
        'E. Desain yang sederhana',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Tool apa yang umum digunakan untuk prototyping?',
      'options': [
        'A. Visual Studio Code',
        'B. Figma',
        'C. MySQL',
        'D. Postman',
        'E. GitHub',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Apa itu accessibility dalam desain?',
      'options': [
        'A. Kecepatan akses aplikasi',
        'B. Kemudahan diakses oleh semua orang',
        'C. Keamanan data pengguna',
        'D. Ketersediaan offline',
        'E. Kompatibilitas browser',
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Apa tujuan dari A/B testing?',
      'options': [
        'A. Membandingkan dua versi desain',
        'B. Menguji kecepatan aplikasi',
        'C. Memvalidasi kode program',
        'D. Mengukur bandwidth',
        'E. Menghitung pengunjung',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa itu moodboard dalam desain?',
      'options': [
        'A. Kumpulan inspirasi visual',
        'B. Diagram alur pengguna',
        'C. Skema warna aplikasi',
        'D. Daftar fitur produk',
        'E. Jadwal proyek',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Prinsip apa yang termasuk dalam Gestalt?',
      'options': [
        'A. Kedekatan (Proximity)',
        'B. Kecepatan (Speed)',
        'C. Kompleksitas (Complexity)',
        'D. Ketinggian (Height)',
        'E. Ketebalan (Thickness)',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa fungsi dari microinteractions?',
      'options': [
        'A. Memberikan feedback kecil',
        'B. Memuat data besar',
        'C. Mengenkripsi informasi',
        'D. Menyimpan cache',
        'E. Mengirim notifikasi',
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Apa itu heuristic evaluation?',
      'options': [
        'A. Evaluasi berdasarkan prinsip usability',
        'B. Pengujian oleh pengguna akhir',
        'C. Analisis kode program',
        'D. Pengukuran performa',
        'E. Survei kepuasan',
      ],
      'correctAnswer': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Inisialisasi timer
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _submitQuiz();
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = answerIndex;
      _answeredQuestions[_currentQuestionIndex] = true;
    });
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < widget.totalQuestions - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _goToQuestion(int index) {
    setState(() {
      _currentQuestionIndex = index;
    });
  }

  void _submitQuiz() {
    _timer.cancel();
    
    // Hitung skor
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (_userAnswers[i] == questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }
    
    double score = (correctAnswers / questions.length) * 100;
    
    // Tampilkan dialog hasil
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          'Kuis Selesai!',
          style: TextStyle(
            color: Color(0xFF8B0000),
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
            Text(
              'Skor Anda: ${score.toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$correctAnswers jawaban benar dari ${questions.length} soal',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: correctAnswers / questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF8B0000)),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            child: const Text(
              'Kembali',
              style: TextStyle(
                color: Color(0xFF8B0000),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Lihat Detail Jawaban'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];
    final isLastQuestion = _currentQuestionIndex == widget.totalQuestions - 1;
    final isFirstQuestion = _currentQuestionIndex == 0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header dengan timer
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            color: const Color(0xFF8B0000),
            child: Column(
              children: [
                // Judul kuis
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        _showExitConfirmation();
                      },
                    ),
                    Expanded(
                      child: Text(
                        widget.quizTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Timer
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _formatTime(_secondsRemaining),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Navigasi nomor soal
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(widget.totalQuestions, (index) {
                      return GestureDetector(
                        onTap: () => _goToQuestion(index),
                        child: Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: _answeredQuestions[index]
                                ? const Color(0xFF4CAF50) // Hijau untuk soal terjawab
                                : index == _currentQuestionIndex
                                    ? const Color(0xFF8B0000) // Merah untuk soal aktif
                                    : Colors.white, // Putih untuk soal belum terjawab
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _answeredQuestions[index]
                                  ? const Color(0xFF4CAF50)
                                  : Colors.black.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _answeredQuestions[index] || index == _currentQuestionIndex
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Konten utama
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Indikator soal
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Soal Nomor ${_currentQuestionIndex + 1} / ${widget.totalQuestions}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B0000),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _answeredQuestions[_currentQuestionIndex]
                                ? const Color(0xFFE8F5E9)
                                : const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: _answeredQuestions[_currentQuestionIndex]
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFF44336),
                            ),
                          ),
                          child: Text(
                            _answeredQuestions[_currentQuestionIndex]
                                ? 'TERJAWAB'
                                : 'BELUM TERJAWAB',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: _answeredQuestions[_currentQuestionIndex]
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFF44336),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Pertanyaan
                  Text(
                    currentQuestion['question'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Pilihan jawaban
                  Column(
                    children: List.generate(currentQuestion['options'].length, (index) {
                      final isSelected = _userAnswers[_currentQuestionIndex] == index;
                      return GestureDetector(
                        onTap: () => _selectAnswer(index),
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFFCDD2) // Salmon merah muda untuk pilihan aktif
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF8B0000).withOpacity(0.5)
                                  : const Color(0xFFE0E0E0),
                              width: isSelected ? 1.5 : 1,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: const Color(0xFFFFCDD2).withOpacity(0.5),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: Row(
                            children: [
                              // Huruf pilihan
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF8B0000)
                                      : const Color(0xFFF5F5F5),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF8B0000)
                                        : const Color(0xFFE0E0E0),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    String.fromCharCode(65 + index), // A, B, C, D, E
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Teks pilihan
                              Expanded(
                                child: Text(
                                  currentQuestion['options'][index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected
                                        ? const Color(0xFF8B0000)
                                        : Colors.black87,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              // Ikon check jika dipilih
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF8B0000),
                                  size: 24,
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Tombol navigasi bawah
          Container(
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
            child: Row(
              children: [
                // Tombol Sebelumnya
                if (!isFirstQuestion)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _goToPreviousQuestion,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF8B0000)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xFF8B0000),
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Soal Sebelumnya',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF8B0000),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                if (!isFirstQuestion) const SizedBox(width: 12),
                
                // Tombol Selanjutnya/Selesai
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLastQuestion) {
                        _submitQuiz();
                      } else {
                        _goToNextQuestion();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLastQuestion
                          ? const Color(0xFF4CAF50) // Hijau untuk tombol Selesai
                          : const Color(0xFF8B0000), // Merah marun untuk Selanjutnya
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLastQuestion ? 'Selesai' : 'Soal Selanjutnya',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (!isLastQuestion)
                          const SizedBox(width: 8),
                        if (!isLastQuestion)
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Keluar dari Kuis',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar? Progress kuis akan disimpan.',
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
              Navigator.pop(context); // Kembali ke halaman sebelumnya
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B0000),
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}