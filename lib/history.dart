// history.dart

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Riwayat Donasi', style: TextStyle(color: Colors.white)),
          centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount:
              6, // Ganti dengan jumlah item riwayat donasi yang sebenarnya
          itemBuilder: (context, index) {
            return _buildHistoryItem();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        currentIndex: 1, // Menandai tab Riwayat sebagai yang aktif
        onTap: (index) {
          // Navigasi ke halaman yang sesuai berdasarkan tab yang ditekan
          if (index == 0) {
            Navigator.pushNamed(context, '/landing');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/account');
          }
        },
      ),
    );
  }

  Widget _buildHistoryItem() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Anda berdonasi bantu pengobatan anak penderita kanker otak',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              'Rp 100.000',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 5),
            Text(
              '28 April 2024',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '20:17',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
