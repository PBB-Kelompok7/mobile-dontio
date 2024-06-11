// method.dart

import 'package:flutter/material.dart';

class MethodPage extends StatefulWidget {
  @override
  _MethodPageState createState() => _MethodPageState();
}

class _MethodPageState extends State<MethodPage> {
  String _selectedMethod = 'BRI';

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
          'Metode Pembayaran',
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
                'Transfer Bank',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildPaymentMethod(
                  'BRI', 'Bank Rakyat Indonesia', 'assets/bri.png'),
              _buildPaymentMethod(
                  'Mandiri', 'Bank Mandiri', 'assets/mandiri.png'),
              _buildPaymentMethod('BCA', 'Bank Central Asia', 'assets/bca.png'),
              _buildPaymentMethod(
                  'BNI', 'Bank Negara Indonesia', 'assets/bni.png'),
              SizedBox(height: 20),
              Text(
                'Pembayaran Instan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildPaymentMethod('GO-PAY', 'GO-PAY', 'assets/gopay.png'),
              _buildPaymentMethod(
                  'ShopeePay', 'ShopeePay', 'assets/shopeepay.png'),
              _buildPaymentMethod('DANA', 'DANA', 'assets/dana.png'),
              _buildPaymentMethod('LinkAja', 'LinkAja', 'assets/linkaja.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String method, String name, String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, {
          'method': name,
          'image': assetPath
        }); // Mengembalikan metode pembayaran yang dipilih beserta gambar
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedMethod == method ? Colors.blue[50] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _selectedMethod == method ? Colors.blue : Colors.grey[300]!,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetPath, height: 40),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (_selectedMethod == method)
              Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}
