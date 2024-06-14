import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resepMasakan.dart';
import 'resepMinuman.dart';
import 'programmerResep.dart';

void main() {
  runApp(const ResepNusantara());
}

class ResepNusantara extends StatelessWidget {
  const ResepNusantara({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cuisine',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep Nusantara Mbok Sarmi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/traditional_food_background.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nusantara Cuisine',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kualitas, Rasa, dan Tradisi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat datang di Nusantara Cuisine',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kami hadir dengan resep-resep nusantara turun-temurun, mempersembahkan kelezatan dari berbagai daerah Nusantara. Kami berkomitmen untuk menyajikan panduan kuliner yang autentik dan mendalam, sehingga Anda dapat mengolah hidangan-hidangan tradisional dengan kepercayaan dan kemudahan. Setiap resep yang kami sajikan tidak hanya menjamin kelezatan yang tiada tara, tetapi juga menghidupkan kembali nilai-nilai budaya dalam setiap suapan.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Layanan Kami:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: Icon(
                          Icons.my_library_books_outlined,
                          size: 35,
                      ),
                      title: Text('Kumpulan Resep Makanan Nusantara'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Memberikan informasi resep masakan terbaik.',
                            maxLines: 2, // Batasi jumlah baris teks subtitle
                            overflow: TextOverflow.ellipsis, // Tambahkan ellipsis jika teks terlalu panjang
                          ),
                          SizedBox(height: 4), // Jarak antara subtitle dan tombol
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResepMasakanPage(),
                                ),
                              );
                            },
                            child: Text('Lihat Selengkapnya'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(
                          Icons.emoji_food_beverage,
                          size: 35
                      ),
                      title: Text('Kumpulan Resep Minuman Nusantara'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Memberikan informasi resep minuman menyegarkan dan sehat.',
                            maxLines: 2, // Batasi jumlah baris teks subtitle
                            overflow: TextOverflow.ellipsis, // Tambahkan ellipsis jika teks terlalu panjang
                          ),
                          SizedBox(height: 4), // Jarak antara subtitle dan tombol
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResepMinumanPage(),
                                ),
                              );
                            },
                            child: Text('Lihat Selengkapnya'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(
                          Icons.supervised_user_circle,
                          size: 35
                      ),
                      title: Text('Programmer Aplikasi Ini'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pembuat aplikasi resep makanan Nusantara.',
                            maxLines: 2, // Batasi jumlah baris teks subtitle
                            overflow: TextOverflow.ellipsis, // Tambahkan ellipsis jika teks terlalu panjang
                          ),
                          SizedBox(height: 4), // Jarak antara subtitle dan tombol
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProgrammerPage(),
                                ),
                              );
                            },
                            child: Text('Lihat Selengkapnya'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi atau tindakan lain
                      },
                      child: const Text('Kritik dan Saran'),
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
