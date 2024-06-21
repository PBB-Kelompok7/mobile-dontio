// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'detail.dart'; // Import file detail.dart untuk mengakses DetailPage

class LandingPage extends StatefulWidget {
  final String token;
  LandingPage({required this.token});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Map<String, dynamic>> _campaigns = [];
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchCampaigns();
  }

  Future<void> _fetchCampaigns() async {
    final url = 'http://localhost:8080/api/v1/campaigns';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> data = jsonData['data'];
        setState(() {
          _campaigns = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load campaigns');
      }
    } catch (e) {
      print('Error fetching campaigns: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
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
          itemCount: _campaigns.length,
          itemBuilder: (context, index) {
            final campaign = _campaigns[index];
            final imageUrl =
                campaign['image_url'] ?? ''; // Get image URL or empty string
            return GestureDetector(
              // Wrap the card with GestureDetector to make it clickable
              onTap: () {
                Navigator.push(
                  // Navigate to DetailPage and pass the campaignId as parameter
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(campaignId: campaign['id']),
                  ),
                );
              },
              child: DonationCard(
                title: campaign['name'],
                imageUrl: 'assets/donation1.png',
                collectedAmount: campaign['current_amount'],
              ),
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
        currentIndex: 0, // Menandai tab Beranda sebagai yang aktif
        onTap: (index) {
          // Navigasi ke halaman yang sesuai berdasarkan tab yang ditekan
          if (index == 0) {
            Navigator.pushNamed(context, '/landing');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/history');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/account');
          }
        },
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int collectedAmount;

  DonationCard({
    required this.title,
    required this.imageUrl,
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
            child: imageUrl.isEmpty
                ? Image.asset(
                    'assets/default_image.png', // Use default image if imageUrl is empty
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.network(
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
                SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
