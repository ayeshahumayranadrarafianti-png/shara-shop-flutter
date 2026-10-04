import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BAGIAN FOTO/GAMBAR DI ATAS (SUDAH MENGGUNAKAN FOTO LOKAL)
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // Pastikan nama file ini sama persis dengan yang ada di folder assets
                  image: const AssetImage('assets/images/banner_login.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.white, Colors.black.withOpacity(0.1)],
                  ),
                ),
              ),
            ),
            
            // FORM LOGIN
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat Datang\ndi Shara Shop',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Silakan login untuk mulai berbelanja',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 30),

                    // EMAIL
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined, color: Colors.pink),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 238, 120, 159)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Email wajib diisi';
                        if (!value.contains('@')) return 'Gunakan format email yang valid';
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // PASSWORD
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline, color: Colors.pink),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.pink),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Password wajib diisi';
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // TOMBOL LOGIN
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: _login,
                        child: const Text('MASUK', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
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
}