import 'package:flutter/material.dart';

class TermPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Syarat dan Ketentuan',
          style: TextStyle(color: Colors.white), // Warna teks menjadi putih
        ),
        backgroundColor: Colors.blue,
        centerTitle: true, // Memusatkan judul
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Warna ikon menjadi putih
          onPressed: () {
            // Kembali ke halaman sebelumnya
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
                'Syarat dan Ketentuan Donasi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),
              Text(
                'Terima kasih telah menggunakan layanan donasi kami. Sebelum melanjutkan, harap perhatikan syarat dan ketentuan berikut:',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. Kewajiban Donatur:',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Donatur wajib memberikan informasi yang akurat dan valid saat melakukan donasi.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Donatur harus berusia minimal 18 tahun atau telah mendapat izin dari orang tua/wali jika berusia di bawah 18 tahun.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '2. Kebijakan Pembayaran:',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Donasi yang telah disampaikan tidak dapat dikembalikan kecuali dalam situasi yang sangat istimewa dan sesuai kebijakan kami.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Kami tidak bertanggung jawab atas kesalahan dalam penulisan nominal donasi oleh donatur.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '3. Keamanan Data:',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Data pribadi donatur akan kami lindungi sesuai dengan kebijakan privasi kami.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 5),
              Text(
                '• Kami tidak akan menyebarkan atau menjual informasi pribadi donatur kepada pihak ketiga tanpa izin.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '4. Kewajiban Pengguna Aplikasi:',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, height: 1.5),
              ),
              // Tambahkan poin-poin tambahan jika diperlukan
            ],
          ),
        ),
      ),
    );
  }
}
