// scan.dart

import 'package:flutter/material.dart';
import 'method.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String _selectedMethod = 'BRI'; // Nilai default untuk metode pembayaran
  String _selectedMethodImage =
      'assets/bri.png'; // Nilai default untuk gambar metode pembayaran

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
        title: Text('Pembayaran'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih nominal donasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3.5,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final amounts = [
                        5000,
                        10000,
                        15000,
                        25000,
                        50000,
                        100000
                      ];
                      return _buildAmountButton(amounts[index]);
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: TextEditingController(text: 'Reemar Martin'),
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller:
                        TextEditingController(text: 'reemarmartin17@gmail.com'),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Metode Pembayaran',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(_selectedMethodImage, height: 40),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(_selectedMethod),
                      ),
                      TextButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MethodPage(),
                            ),
                          );

                          if (result != null && result is Map<String, String>) {
                            setState(() {
                              _selectedMethod = result['method']!;
                              _selectedMethodImage = result['image']!;
                            });
                          }
                        },
                        child: Text('Ganti'),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  Text(
                    'Total Donasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rp 50.000',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Scan QR Code',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Image.asset('assets/scan.png',
                                      height: 200,
                                      width:
                                          200), // Ganti dengan path gambar QR code yang sesuai
                                  SizedBox(height: 10),
                                  Text(
                                    '0035D1234577C42024',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 15),
                                      textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Text('Lanjutkan'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Bayar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountButton(int amount) {
    return ChoiceChip(
      label: Text(
        amount.toString(),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      selected: false,
      onSelected: (bool selected) {
        // Aksi saat pilihan nominal donasi dipilih
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[200],
    );
  }
}
