import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for jsonDecode

class Kelompok3 extends StatefulWidget {
  @override
  _Kelompok3State createState() => _Kelompok3State();
}

class _Kelompok3State extends State<Kelompok3> {
  Future<List> _getData() async {
    final response = await http
        .get(Uri.parse('http://192.168.18.7/flutterapi/nusantara/read.php'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelompok Kami'),
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: _getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data found.'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data![index];
                    Color bgColor = Color.fromARGB(255, 100, 116, 223);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: bgColor,
                        border: Border.all(
                          color: Color.fromARGB(255, 100, 116, 223),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          item['nama'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          item['nim'],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Kelompok3(),
  ));
}
