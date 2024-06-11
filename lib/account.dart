// account.dart

import 'package:flutter/material.dart';
import 'edit.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _name = 'Reemar Martin Marsinah';
  String _email = 'reemarmartin17@gmail.com';
  String _dob = '29-02-2002';

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
        centerTitle: true,
        title: Text(
          'Akun',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/reemar.png'), // Ganti dengan path gambar profil yang sesuai
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _email,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        _dob,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(
                          name: _name,
                          email: _email,
                          dob: _dob,
                        ),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        _name = result['name'];
                        _email = result['email'];
                        _dob = result['dob'];
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Syarat dan Ketentuan'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/splash2'); // Aksi untuk membuka halaman syarat dan ketentuan
              },
            ),
            ListTile(
              title: Text('Tentang Kami'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/tentang'); // Aksi untuk membuka halaman tentang kami
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol "Log Out" ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                side: BorderSide(color: Colors.blue),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Log Out'),
            ),
            SizedBox(height: 20),
          ],
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
        currentIndex: 2, // Menandai tab Akun sebagai yang aktif
        onTap: (index) {
          // Navigasi ke halaman yang sesuai berdasarkan tab yang ditekan
          if (index == 0) {
            Navigator.pushNamed(context, '/landing');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/history');
          }
        },
      ),
    );
  }
}
