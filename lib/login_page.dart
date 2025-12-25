import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF8B0000),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            // DIBUAT TANPA SCROLL DENGAN physics: NeverScrollableScrollPhysics()
            physics: const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    // Header dengan gambar gedung dan kurva - TETAP
                    Stack(
                      children: [
                        // Gambar gedung dengan kurva
                        ClipPath(
                          clipper: CurveClipper(),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                  'assets/images/login_header.jpg',
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Logo lingkaran di tengah (overlap)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF8B0000),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/LogoTel-U 1.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(
                                        Icons.school,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Spacer untuk mengkompensasi overlap logo
                    const SizedBox(height: 50),

                    // Form login - SEMUA DIKECILKAN AGAR MUAT TANPA SCROLL
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Judul - DIKECILKAN
                            const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 28, // DIKECILKAN DARI 32
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B0000),
                              ),
                            ),
                            const SizedBox(height: 3), // DIKECILKAN
                            const Text(
                              'Email 365',
                              style: TextStyle(
                                fontSize: 16, // DIKECILKAN DARI 18
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 20), // DIKECILKAN DARI 30
                            // Email Field - DIKECILKAN
                            SizedBox(
                              height: 60, // TINGGI TETAP
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Color(0xFF8B0000),
                                    size: 20,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF8B0000),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF8B0000),
                                      width: 2,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, // DIKECILKAN
                                    vertical: 12, // DIKECILKAN
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 14,
                                ), // DIKECILKAN
                              ),
                            ),
                            const SizedBox(height: 15), // DIKECILKAN DARI 20
                            // Password Field - DIKECILKAN
                            SizedBox(
                              height: 60, // TINGGI TETAP
                              child: TextField(
                                controller: _passwordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color(0xFF8B0000),
                                    size: 20,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xFF8B0000),
                                      size: 20, // DIKECILKAN
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF8B0000),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF8B0000),
                                      width: 2,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, // DIKECILKAN
                                    vertical: 12, // DIKECILKAN
                                  ),
                                ),
                                style: const TextStyle(
                                  fontSize: 14,
                                ), // DIKECILKAN
                              ),
                            ),
                            const SizedBox(height: 8), // DIKECILKAN DARI 10
                            // Remember me checkbox - DIKECILKAN
                            Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                  activeColor: const Color(0xFF8B0000),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                const Text(
                                  'Ingat saya',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ), // DIKECILKAN
                                ),
                                const Spacer(),
                                // Forgot Password link
                                TextButton(
                                  onPressed: () {
                                    // Aksi lupa password
                                  },
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.zero, // DIKECILKAN PADDING
                                    minimumSize: Size.zero, // DIKECILKAN SIZE
                                  ),
                                  child: const Text(
                                    'Lupa Password?',
                                    style: TextStyle(
                                      color: Color(0xFF8B0000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13, // DIKECILKAN
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20), // DIKECILKAN DARI 30
                            // Login Button - DIKECILKAN
                            SizedBox(
                              height: 50, // DIKECILKAN DARI 16+16 padding
                              child: ElevatedButton(
                                onPressed: () {
                                  _performLogin();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8B0000),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 3,
                                ),
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 16, // DIKECILKAN DARI 18
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15), // DIKECILKAN DARI 20
                            // Divider dengan teks "atau" - DIKECILKAN
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ), // DIKECILKAN
                                  child: Text(
                                    'atau',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12, // DIKECILKAN
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15), // DIKECILKAN DARI 20
                            // Help Button - DIKECILKAN
                            SizedBox(
                              height: 50, // DIKECILKAN
                              child: OutlinedButton(
                                onPressed: () {
                                  _showHelpDialog();
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                    color: Color(0xFF8B0000),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Bantuan ?',
                                  style: TextStyle(
                                    fontSize: 16, // DIKECILKAN DARI 18
                                    color: Color(0xFF8B0000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15), // DIKECILKAN DARI 20
                            // Footer/Additional Info - DIKECILKAN
                            const Column(
                              children: [
                                Text(
                                  'Belum punya akun?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ), // DIKECILKAN
                                ),
                                SizedBox(height: 3), // DIKECILKAN
                                Text(
                                  'Hubungi Administrator',
                                  style: TextStyle(
                                    color: Color(0xFF8B0000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12, // DIKECILKAN
                                  ),
                                ),
                              ],
                            ),

                            // Spacer untuk mendorong konten ke atas
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _performLogin() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Harap isi email dan password');
      return;
    }

    _showSnackBar('Login berhasil! (Simulasi)');
    _emailController.clear();
    _passwordController.clear();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF8B0000),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Bantuan',
          style: TextStyle(
            color: Color(0xFF8B0000),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Untuk bantuan login:'),
            SizedBox(height: 10),
            Text('1. Pastikan email yang dimasukkan benar'),
            Text('2. Password harus sesuai'),
            Text('3. Hubungi admin jika lupa password'),
            SizedBox(height: 10),
            Text('Email: admin@example.com'),
            Text('Telp: 021-12345678'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Tutup',
              style: TextStyle(color: Color(0xFF8B0000)),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom clipper untuk membuat kurva di bagian bawah header
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    // Membuat kurva
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
