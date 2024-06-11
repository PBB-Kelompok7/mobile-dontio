// splash_screen.dart

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dontio',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/splash.png', // ganti dengan path gambar Anda
              height: 300,
            ),
            SizedBox(height: 50),
            HoverButton(),
          ],
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isHovering ? Colors.blue.shade700 : Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        onHover: (hovering) {
          setState(() {
            _isHovering = hovering;
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
          ),
          child: Text(
            'Mulai Sekarang',
            style: TextStyle(
              fontSize: 20,
              color: _isHovering ? Colors.white : Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
