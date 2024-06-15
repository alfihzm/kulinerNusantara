import 'package:flutter/material.dart';
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
        title: const Text(
          'Nusantara Cuisine',
          style: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                          fontFamily: 'Quicksand',
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kualitas, Rasa, dan Tradisi',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
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
                      fontFamily: 'Quicksand',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kami hadir dengan informasi makanan dan minuman nusantara turun-temurun, mempersembahkan kelezatan dari berbagai daerah Nusantara. Kami berkomitmen untuk menyajikan panduan kuliner yang autentik dan mendalam, sehingga Anda dapat mengolah hidangan-hidangan tradisional dengan kepercayaan dan kemudahan.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Daftar Kami:',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Quicksand',
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
                      title: const Text(
                        'Kumpulan Informasi Makanan Nusantara',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Memberikan informasi masakan terbaik.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          SizedBox(height: 4),
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
                      leading: Icon(Icons.emoji_food_beverage, size: 35),
                      title: const Text(
                        'Kumpulan Informasi Minuman Nusantara',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Memberikan informasi minuman menyegarkan dan sehat.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          SizedBox(height: 4),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResepMinumanPage(),
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
                      leading: Icon(Icons.supervised_user_circle, size: 35),
                      title: const Text(
                        'Programmer Aplikasi Ini',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pembuat aplikasi ensiklopedia makanan & minuman Nusantara.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          SizedBox(height: 4),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProgrammerPage(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
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
