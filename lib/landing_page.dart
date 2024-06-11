// landing_page.dart

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 8.0), // Menambahkan padding atas dan bawah
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari donasi panti asuhan, kekurangan gizi, dll.',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return DonationCard(
              imageUrl:
                  'assets/donation${index + 1}.png', // Ganti dengan path gambar yang sesuai
              title: [
                'Bantu Pengobatan Anak Penderita Kanker Otak',
                'Berkah Jum\'at Sedekah Makanan Yatim Dhuafa',
                'Pendidikan Layak untuk Generasi Masa Depan',
                'Memberi Makanan bagi Anak-Anak Kurang Beruntung',
                'Hidupkan Kembali Kawasan Hutan yang Terancam',
                'Bantuan Kemanusiaan Korban Bencana',
              ][index],
              collectedAmount: [
                50432000,
                11826000,
                12500000,
                9200000,
                8500000,
                11200000
              ][index],
            );
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
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int collectedAmount;

  DonationCard({
    required this.imageUrl,
    required this.title,
    required this.collectedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  'Terkumpul :',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Rp ${collectedAmount.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: collectedAmount /
                      50000000, // asumsi target donasi 50 juta
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(
                    height:
                        4), // Mengurangi padding bottom antara LinearProgressIndicator dan bagian bawah kartu
              ],
            ),
          ),
        ],
      ),
    );
  }
}
