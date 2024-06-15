import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi Minuman Nusantara',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ResepMinumanPage(),
    );
  }
}

class ResepMinumanPage extends StatefulWidget {
  @override
  _ResepMinumanPageState createState() => _ResepMinumanPageState();
}

class _ResepMinumanPageState extends State<ResepMinumanPage> {
  List<Map<String, dynamic>> _listData = [
    {
      'nama': 'Kopi Tubruk',
      'deskripsi':
          'Kopi Tubruk adalah salah satu cara penyajian kopi tradisional Indonesia yang sangat khas dan populer. Dibuat dengan cara sederhana, bubuk kopi kasar dicampur dengan air panas dan dibiarkan mengendap, menciptakan rasa kopi yang kuat dan kaya. Kopi Tubruk sering disajikan dengan gula, yang bisa ditambahkan sesuai selera, memberikan keseimbangan sempurna antara rasa pahit dan manis. Aromanya yang menggugah selera dan cita rasanya yang otentik membuat Kopi Tubruk menjadi pilihan favorit bagi pecinta kopi sejati di Indonesia.',
      'gambar': 'assets/images/drink/kopi_tubruk.jpg'
    },
    {
      'nama': 'Kopi Luwak',
      'deskripsi':
          'Kopi Luwak adalah salah satu kopi termahal dan paling eksklusif di dunia, berasal dari Indonesia. Proses unik pembuatannya melibatkan biji kopi yang telah dimakan dan dicerna oleh luwak (musang kelapa). Biji kopi ini kemudian dikumpulkan dari kotoran luwak, dibersihkan, diproses, dan disangrai hingga mencapai cita rasa yang sangat khas. Kopi Luwak dikenal karena kelembutan rasanya, rendahnya tingkat keasaman, dan aroma yang kaya serta kompleks. Setiap cangkir Kopi Luwak menawarkan pengalaman minum kopi yang mewah dan istimewa, mencerminkan keunikan dan kekayaan alam Indonesia.',
      'gambar': 'assets/images/drink/kopi_luwak.jpg'
    },
    {
      'nama': 'Wedang Jahe',
      'deskripsi':
          'Wedang Jahe adalah minuman tradisional Indonesia yang terbuat dari jahe segar yang direbus dengan air panas, menghasilkan minuman hangat yang menenangkan. Kadang-kadang, gula merah atau gula aren ditambahkan untuk memberikan rasa manis alami yang seimbang dengan kehangatan jahe. Wedang Jahe tidak hanya nikmat dan menyegarkan, tetapi juga dikenal memiliki manfaat kesehatan, seperti membantu menghangatkan tubuh dan meredakan gejala flu. Minuman ini sering dinikmati pada malam hari atau saat cuaca dingin, menciptakan perasaan nyaman dan rileks.',
      'gambar': 'assets/images/drink/wedang_jahe.jpg'
    },
    {
      'nama': 'Soda Gembira',
      'deskripsi':
          'Soda Gembira adalah minuman segar dan manis yang populer di Indonesia, terutama di kalangan anak-anak dan remaja. Minuman ini terbuat dari campuran susu kental manis, sirup merah, dan air soda, menciptakan kombinasi rasa yang menyenangkan dan memuaskan. Warnanya yang cerah dan rasa yang manis menjadikan Soda Gembira pilihan yang sempurna untuk menyegarkan diri di hari yang panas atau sebagai pelengkap saat makan bersama keluarga dan teman-teman.',
      'gambar': 'assets/images/drink/soda_gembira.jpg'
    },
    {
      'nama': 'Teh Talua',
      'deskripsi':
          'Teh Talua adalah minuman khas dari Sumatera Barat, Indonesia, yang terkenal dengan kekhasan dan keunikannya. Minuman ini dibuat dari campuran teh hitam kental yang dicampur dengan telur ayam kampung dan gula, kemudian dikocok hingga berbusa. Terkadang, sedikit perasan jeruk nipis atau kayu manis ditambahkan untuk memberikan aroma dan rasa yang lebih kompleks. Teh Talua biasanya dinikmati untuk menambah stamina dan menghangatkan tubuh, serta menjadi bagian penting dari tradisi minum teh di daerah Minangkabau.',
      'gambar': 'assets/images/drink/teh_talua.jpg'
    },
    {
      'nama': 'Sekoteng',
      'deskripsi':
          'Sekoteng adalah minuman tradisional Indonesia yang hangat dan menyegarkan, populer di daerah Jawa Tengah dan sekitarnya. Minuman ini terbuat dari campuran jahe hangat dengan berbagai bahan isian seperti kacang hijau, kacang tanah, pacar cina (sejenis manisan mutiara), kolang-kaling, dan potongan roti tawar. Gula merah atau gula pasir ditambahkan untuk memberikan rasa manis yang seimbang dengan kehangatan jahe. Sekoteng sering dinikmati pada malam hari atau saat cuaca dingin, menawarkan rasa yang kaya dan berkhasiat menghangatkan tubuh.',
      'gambar': 'assets/images/drink/sekoteng.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Minuman Nusantara'),
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
        title: Text('$title'),
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
