// payment.dart

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedAmount = 50000;
  TextEditingController _nameController =
      TextEditingController(text: 'Reemar Martin');
  TextEditingController _emailController =
      TextEditingController(text: 'reemarmartin17@gmail.com');

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
        title: Text(
          'Pembayaran',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      2.5, // Menyesuaikan rasio aspek untuk memperbesar ukuran
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final amounts = [5000, 10000, 15000, 25000, 50000, 100000];
                  return _buildAmountButton(amounts[index]);
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
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
                  Image.asset('assets/bri.png', height: 40),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(''), // Menghilangkan tulisan BRI
                  ),
                  TextButton(
                    onPressed: () {
                      // Aksi untuk mengganti metode pembayaran
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
                'Rp ${_selectedAmount.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol "Bayar" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
    );
  }

  Widget _buildAmountButton(int amount) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAmount = amount;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedAmount == amount
              ? Colors.blue
              : const Color.fromARGB(255, 150, 210, 238),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Text(
            amount.toString(),
            style: TextStyle(
              color: _selectedAmount == amount
                  ? Colors.white
                  : const Color.fromARGB(255, 144, 144, 144),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
