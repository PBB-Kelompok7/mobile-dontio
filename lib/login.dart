import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<loginPage> {
  bool _obscureText =
      true; // Mengontrol apakah password disembunyikan atau tidak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masuk Akun',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/masuk.png', // Ganti dengan path gambar Anda
                height: 200,
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: _obscureText, // Mengontrol visibilitas password
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Mengubah status visibilitas
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol "Masuk" ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Masuk'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Aksi saat tombol "Daftar" ditekan
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: Text(
                  'Belum mempunyai akun ? Daftar',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
