// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio; // Import dio
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as storage; // Import flutter_secure_storage with alias 'storage'

class PaymentPage extends StatefulWidget {
  final int campaignId;

  PaymentPage({required this.campaignId});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedAmount = 50000;
  TextEditingController _nameController =
      TextEditingController(text: 'Reemar Martin');
  TextEditingController _emailController =
      TextEditingController(text: 'reemarmartin17@gmail.com');
  final dio.Dio _dio = dio.Dio();
  final storage.FlutterSecureStorage _storage = storage.FlutterSecureStorage();
  bool _isSubmitting = false;
  late Map<String, dynamic> _campaignData = {};

  // Token disimpan sebagai konstanta
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozfQ.Iu93-P2k7hmryP9CSGMeZ8GCSrCRrJMIKQhlKydqibQ';

  @override
  void initState() {
    super.initState();
    _fetchCampaignDetail(widget.campaignId);
  }

  Future<void> _fetchCampaignDetail(int campaignId) async {
    final url = 'http://localhost:8080/api/v1/campaigns/$campaignId';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final Map<String, dynamic> data = jsonData['data'];
        setState(() {
          _campaignData = data;
        });
      } else {
        throw Exception('Failed to load campaign detail');
      }
    } catch (e) {
      print('Error fetching campaign detail: $e');
    }
  }

  Future<void> _submitDonation() async {
    if (_isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    final donationUrl = 'http://localhost:8080/api/v1/donations';
    final data = {
      'campaign_id': widget.campaignId,
      'amount': _selectedAmount,
    };

    try {
      final response = await _dio.post(
        donationUrl,
        data: data,
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer $token', // Gunakan token langsung di sini
          },
        ),
      );

      // Print the response for debugging purposes
      print('Response data: ${response.data}');
      print('Response status code: ${response.statusCode}');
      print('Response headers: ${response.headers}');

      if (response.statusCode == 200) {
        _showSuccessMessage();
      } else {
        _showErrorMessage();
      }
    } catch (e) {
      print('Error submitting donation: $e');
      _showErrorMessage();
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _showSuccessMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sukses'),
        content: Text('Donasi berhasil dilakukan. Terima kasih!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Gagal'),
        content: Text('Terjadi kesalahan saat mengirim donasi. Coba lagi.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_campaignData.isEmpty) {
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
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
                  childAspectRatio: 2.5,
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
                    child: Text(''),
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
              Text(
                'Detail Kampanye',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Nama Kampanye: ${_campaignData['name']}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Target Donasi: Rp ${_campaignData['goal_amount'].toString()}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitDonation,
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
                  child: _isSubmitting
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text('Bayar'),
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
            'Rp ${amount.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
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
