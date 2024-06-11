import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Kami',
          style: TextStyle(color: Colors.white), // Warna teks menjadi putih
        ),
        backgroundColor: Colors.blue,
        centerTitle: true, // Memusatkan judul
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Warna ikon menjadi putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Selamat datang di aplikasi Dontio!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Kami adalah platform yang bertujuan untuk memudahkan Anda dalam memberikan bantuan kepada mereka yang membutuhkan, dengan transparansi dan keamanan sebagai prinsip utama kami.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Visi kami adalah menciptakan dunia di mana setiap individu memiliki kesempatan untuk memberikan kontribusi positif kepada masyarakat, tanpa hambatan atau keraguan. Melalui teknologi, kami ingin memperluas jangkauan kebaikan dan memfasilitasi koneksi antara mereka yang ingin membantu dengan mereka yang membutuhkan bantuan.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Berikut adalah beberapa nilai inti kami:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '1. Transparansi',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Kami berkomitmen untuk memberikan transparansi penuh dalam pengelolaan donasi. Setiap dana yang terkumpul dan penggunaannya akan dilaporkan secara terbuka kepada para donatur.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '2. Keamanan',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Keamanan data pribadi donatur adalah prioritas utama kami. Kami menggunakan teknologi terkini untuk melindungi data Anda dan memastikan proses donasi yang aman.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
