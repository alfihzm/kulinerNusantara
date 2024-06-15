import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi Masakan Nusantara',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ResepMasakanPage(),
    );
  }
}

class ResepMasakanPage extends StatefulWidget {
  @override
  _ResepMasakanPageState createState() => _ResepMasakanPageState();
}

class _ResepMasakanPageState extends State<ResepMasakanPage> {
  List<Map<String, dynamic>> _listData = [
    {
      'nama': 'Nasi Goreng',
      'deskripsi':
          'Nasi goreng Indonesia adalah salah satu hidangan paling ikonik dan dicintai dari Nusantara. Dengan bahan dasar nasi putih yang digoreng dengan bumbu-bumbu khas, nasi goreng ini menawarkan perpaduan rasa yang kaya dan kompleks. Aromanya yang menggugah selera berasal dari campuran bawang putih, bawang merah, kecap manis, dan berbagai rempah pilihan yang dimasak hingga sempurna.',
      'gambar': 'assets/images/food/nasi_goreng.jpg',
    },
    {
      'nama': 'Rendang',
      'deskripsi':
          'Rendang Indonesia adalah hidangan legendaris yang menggambarkan keunggulan dan kekayaan kuliner Nusantara. Berasal dari Sumatera Barat, rendang adalah olahan daging sapi yang dimasak perlahan dengan campuran rempah-rempah yang melimpah, santan, dan berbagai bumbu aromatik. Proses memasak yang lama, yang bisa memakan waktu berjam-jam, menghasilkan daging yang empuk dengan rasa yang dalam dan kompleks.',
      'gambar': 'assets/images/food/rendang.jpg',
    },
    {
      'nama': 'Soto Betawi',
      'deskripsi':
          'Soto Betawi adalah salah satu kuliner khas Jakarta yang terkenal dengan kuah santannya yang kaya dan lezat. Hidangan ini merupakan perpaduan sempurna dari daging sapi atau jeroan yang dimasak dengan bumbu-bumbu tradisional dan santan kental, menciptakan rasa yang gurih dan beraroma.',
      'gambar': 'assets/images/food/soto_betawi.jpg',
    },
    {
      'nama': 'Sate Ayam',
      'deskripsi':
          'Sate ayam adalah salah satu hidangan paling populer dan ikonik dari Indonesia, yang dikenal dan dicintai di seluruh penjuru dunia. Hidangan ini terdiri dari potongan daging ayam yang ditusuk dengan tusukan bambu atau kayu, lalu dibakar di atas arang hingga matang sempurna. Proses pemanggangan ini memberikan aroma yang khas dan rasa yang kaya pada daging ayam. Sate ayam biasanya direndam dalam bumbu marinasi sebelum dibakar. Marinasi ini sering kali terdiri dari campuran kecap manis, bawang putih, bawang merah, ketumbar, dan sedikit gula merah, yang semuanya berperan dalam memberikan rasa manis, gurih, dan sedikit pedas pada sate. Setelah dibakar, sate ayam disajikan dengan bumbu kacang yang kental dan gurih, yang dibuat dari kacang tanah, kecap manis, bawang putih, cabai, dan sedikit air jeruk nipis untuk memberikan kesegaran.',
      'gambar': 'assets/images/food/sate_ayam.jpg',
    },
    {
      'nama': 'Ketoprak',
      'deskripsi':
          'Ketoprak adalah salah satu hidangan jalanan yang populer di Indonesia, khususnya di Jakarta. Hidangan ini terdiri dari kombinasi yang harmonis antara bahan-bahan sederhana namun kaya akan rasa dan tekstur. Ketoprak sering kali dijajakan oleh pedagang kaki lima dan dinikmati sebagai makanan sehari-hari yang lezat dan terjangkau.',
      'gambar': 'assets/images/food/ketoprak.jpg',
    },
    {
      'nama': 'Bakso',
      'deskripsi':
          'Bakso adalah salah satu hidangan yang sangat populer dan digemari di Indonesia. Hidangan ini terdiri dari bola-bola daging yang kenyal dan gurih, biasanya terbuat dari campuran daging sapi giling dan tepung tapioka. Bakso disajikan dalam kuah kaldu yang lezat, hangat, dan aromatik, sering kali dilengkapi dengan mi, bihun, atau kwetiau. Komponen utama bakso adalah bola daging yang dibuat dengan adonan yang diaduk hingga mencapai tekstur yang kenyal dan lembut. Bakso dapat memiliki berbagai variasi, termasuk bakso urat (dengan potongan urat sapi), bakso telur (dengan isian telur di dalamnya), dan bakso keju (dengan isian keju).',
      'gambar': 'assets/images/food/bakso.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Masakan Nusantara'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dua kolom
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75, // Atur rasio aspek anak agar sesuai
          ),
          itemCount: _listData.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  _showDetailDialog(
                      _listData[index]['nama'], _listData[index]['deskripsi']);
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        _listData[index]['gambar'],
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _listData[index]['nama'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        _showDetailDialog(_listData[index]['nama'],
                            _listData[index]['deskripsi']);
                      },
                      child: Text('Info Selengkapnya'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showDetailDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Informasi $title'),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Tutup'),
          ),
        ],
      ),
    );
  }
}
