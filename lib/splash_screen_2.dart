// splash_screen_2.dart

import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Bergabung!',
              style: TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/splash2.png', // ganti dengan path gambar Anda
              height: 200,
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol "Mulai Donasi" ditekan
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
              child: Text('Mulai Donasi'),
            ),
          ],
        ),
      ),
    );
  }
}
