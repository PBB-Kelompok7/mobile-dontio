import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'payment.dart'; // Ganti 'your_project_name' dengan nama proyek Anda

class DetailPage extends StatefulWidget {
  final int campaignId;

  DetailPage({required this.campaignId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Map<String, dynamic> _campaignData;
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _campaignData = {}; // Inisialisasi _campaignData dengan nilai awal
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

  @override
  Widget build(BuildContext context) {
    if (_campaignData.isEmpty) {
      // Periksa apakah _campaignData masih kosong
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _campaignData['image_url'] ?? '',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _campaignData['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _campaignData['user']['name'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp ${_campaignData['current_amount'].toString()}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '${_campaignData['backer_count']} donatur',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Target : Rp ${_campaignData['goal_amount'].toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cerita Penggalangan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _campaignData['description'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman pembayaran dengan membawa campaignId
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              campaignId: widget.campaignId,
                            ),
                          ),
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
                      child: Text('Donasi Sekarang'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
