import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'userPage.dart';

class SaranPage extends StatefulWidget {
  const SaranPage({Key? key}) : super(key: key);

  @override
  _SaranPageState createState() => _SaranPageState();
}

class _SaranPageState extends State<SaranPage> {
  late Future<void> _userDataFuture;
  String? fullName;
  String? userEmail;

  TextEditingController _saranController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userDataFuture = _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFullName = prefs.getString('nama');
    String? savedEmail = prefs.getString('email');
    setState(() {
      fullName = savedFullName;
      userEmail = savedEmail;
    });
  }

  void _submitSaran() async {
    String saran = _saranController.text;
    if (saran.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? nama = prefs.getString('nama');
      String? email = prefs.getString('email');

      if (nama != null && email != null) {
        var url =
            Uri.parse('http://192.168.18.7/flutterapi/nusantara/saran.php');

        var response = await http.post(
          url,
          body: {
            'nama': nama,
            'email': email,
            'saran': saran,
          },
        );

        if (response.statusCode == 200) {
          try {
            var data = jsonDecode(response.body);
            if (data['status'] == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Saran berhasil dikirim'),
                  duration: Duration(seconds: 3),
                ),
              );
              _saranController.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Pengiriman gagal: ${data['message']}'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          } catch (e) {
            _showErrorDialog('Terjadi kesalahan saat memproses data: $e');
          }
        } else {
          _showErrorDialog(
              'Gagal mengirim data ke server. Status code: ${response.statusCode}, Body: ${response.body}');
        }
      } else {
        _showErrorDialog('Data user tidak ditemukan. Silakan login kembali.');
      }
    } else {
      _showErrorDialog('Mohon masukkan saran Anda terlebih dahulu.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Saran',
          style: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: _userDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Anda masuk sebagai: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: fullName ?? 'User',
                          style: TextStyle(
                            color: Color.fromARGB(255, 86, 99, 187),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 203, 159, 118)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 255, 255)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Color.fromARGB(255, 203, 159, 118)),
                        ),
                      ),
                    ),
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _saranController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Masukkan saran Anda...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitSaran,
                    child: Text(
                      'Kirim',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 86, 187, 111)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _saranController.dispose();
    super.dispose();
  }
}
