import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'detail_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // DAFTAR PRODUK YANG SUDAH DISESUAIKAN (Warna dan Motif)
  final List<ProductModel> daftarProduk = [
    ProductModel(
      nama: 'Bella Square Hijab',
      kategori: 'Segiempat',
      harga: 25000,
      imagePath: 'assets/images/bella_square.jpg',
      stok: 150,
      warna: ['Hitam', 'Navy', 'Cream', 'Broken White', 'Putih', 'CandyRose', 'Taro', 'Mahogany', 'Beige', 'Khaki'],
      motif: [], // <-- Tambahkan ini meskipun kosong
      rating: 4.8,
      ulasan: ['Bahan adem banget!', 'Warnanya sesuai gambar, suka!'],
      listGambar: [
      'assets/images/bella_hitam.jpg',
      'assets/images/bella_navy.jpg',
      'assets/images/bella_cream.jpg', 
      'assets/images/bella_brokenwhite.jpg',
      'assets/images/bella_putih.jpg',
      'assets/images/bella_candyrose.jpg',
      'assets/images/bella_taro.jpg',
      'assets/images/bella_mahogany.jpg',
      'assets/images/bella_beige.jpg',
      'assets/images/bella_khaki.jpg',
    ],
    ),
    ProductModel(
      nama: 'Pashmina Ceruty',
      kategori: 'Pashmina',
      harga: 35000,
      imagePath: 'assets/images/pashmina_ceruty.jpg',
      stok: 8,
      warna: ['Sage Green', 'Latte', 'Hitam', 'Putih', 'Navy', 'Pink Soft', 'Mocca', 'Maroon'],
      motif: [],
      rating: 4.9,
      ulasan: ['Gampang dibentuk, mantap.', 'Pengiriman cepat.'],
      listGambar: [
      'assets/images/ceruty_sagegreen.jpg',
      'assets/images/ceruty_latte.jpg',
      'assets/images/ceruty_hitam.jpg', 
      'assets/images/ceruty_putih.jpg',
      'assets/images/ceruty_navy.jpg',
      'assets/images/ceruty_pinksoft.jpg',
      'assets/images/ceruty_mocca.jpg',
      'assets/images/ceruty_maroon.jpg',
    ],
    ),
    ProductModel(
      nama: 'Kulot Motif Premium',
      kategori: 'Celana',
      harga: 35000,
      imagePath: 'assets/images/kulot_motif.jpeg', 
      stok: 100,
      warna: [], 
      motif: ['Polka Mahogany', 'Salur Soft Pink', 'Ravena', 'Salur Pita Pink', 'Marshanda Pink', 'Aisyah Ungu', 'Pita Biru', 'Polka Hitam', 'Ariel Black', 'Aspire Black', 'Aurel Pink', 'Savana Choco'], 
      rating: 4.8,
      ulasan: ['Motifnya lucu!', 'Bahan adem.'],
       listGambar: [
      'assets/images/kulot_polkamahogany.jpg',
      'assets/images/kulot_salursofpink.jpg',
      'assets/images/kulot_ravena.jpg', 
      'assets/images/kulot_marshanda.jpg',
      'assets/images/kulot_salurpita.jpg',
      'assets/images/kulot_aisyahungu.jpg',
      'assets/images/kulot_pitabiru.jpg',
      'assets/images/kulot_polkahitam.jpg',
      'assets/images/kulot_arielblack.jpg',
      'assets/images/kulot_aspireblack.jpg',
      'assets/images/kulot_aurelpink.jpg',
      'assets/images/kulot_savanachoco.jpg',
       ]
    ),
     ProductModel(
      nama: 'Bergo Sport',
      kategori: 'Jilbab Instan',
      harga: 25000,
      imagePath: 'assets/images/bergo_sport.jpg', 
      stok: 121,
      warna: ['Silver', 'Dusty Pink', 'Abu Tua', 'Maroon', 'Matcha' 'Mocha', 'Cappucino', 'Cokelat', 'Putih', 'Hitam', 'Salem', 'Taro', 'Hazelnut', 'Dove', 'Espresso', 'Hijau Tua'], // Warna dikosongkan karena dia pakai Motif
      motif: [], 
      rating: 4.9,
      ulasan: ['Warna nya bagus', 'Bahan adem', 'Sangatt nyaman dipakee'],
      listGambar: [
      'assets/images/bergo_silver.jpg',
      'assets/images/bergo_dustypink.jpg',
      'assets/images/bergo_abutua.jpg',
      'assets/images/bergo_maroon.jpg',
      'assets/images/bergo_matcha.jpg',
      'assets/images/bergo_mocha.jpg',
      'assets/images/bergo_cappucino.jpg',
      'assets/images/bergo_cokelat.jpg',
      'assets/images/bergo_putih.jpg',
      'assets/images/bergo_hitam.jpg',
      'assets/images/bergo_salem.jpg',
      'assets/images/bergo_taro.jpg',
      'assets/images/bergo_hazelnut.jpg',
      'assets/images/bergo_dove.jpg',
      'assets/images/bergo_espresso.jpg',
      'assets/images/bergo_hijautua.jpg',
    ],
    ),
    ProductModel(
      nama: 'Pashmina Viscose',
      kategori: 'Pashmina',
      harga: 45000,
      imagePath: 'assets/images/pashmina_viscose.jpg',
      stok: 90,
      warna: ['V.Black', 'V.Latte', 'V.Navy', 'V.CandyRose', 'V.Ivory', 'V.Beige', 'V.Biskuit', 'V.Buttercream', 'V.Charcoal', 'V.BW', 'V.DarkMaroon', 'V.Hazelnude'],
      motif: [],
      rating: 4.9,
      ulasan: ['Hijabnya baguss bangett, bahannya dingin, mudah diatur', 'adminnya fast responn bangett!!'],
      listGambar: [
      'assets/images/viscose_black.jpg',
      'assets/images/viscose_latte.jpg',
      'assets/images/viscose_navy.jpg', 
      'assets/images/viscose_candyrose.jpg',
      'assets/images/viscose_ivory.jpg',
      'assets/images/viscose_beige.jpg',
      'assets/images/viscose_biskuit.jpg',
      'assets/images/viscose_buttercream.jpg',
      'assets/images/viscose_charcoal.jpg',
      'assets/images/viscose_bw.jpg',
      'assets/images/viscose_darkmaroon.jpg',
      'assets/images/viscose_hazelnude.jpg',
    ]
    ),
    ProductModel(
      nama: 'Rajut Salur Stripe',
      kategori: 'Cardigan',
      harga: 40000,
      imagePath: 'assets/images/rajut_strip.jpeg', 
      stok: 190,
      warna: ['Cream', 'Black', 'Maroon', 'Blue', 'Mahogany'], 
      motif: [], 
      rating: 4.8,
      ulasan: ['Motifnya lucu!', 'Bahan lembut dan nyaman bangett'],
      listGambar: [
      'assets/images/rajut_cream.jpg',
      'assets/images/rajut_black.jpg',
      'assets/images/rajut_maroon.jpg',
      'assets/images/rajut_blue.jpg',
      'assets/images/rajut_mahogany.jpg',
    ]
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Widget tabBeranda = Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Shara Shop', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.00,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: daftarProduk.length,
        itemBuilder: (context, index) {
          final produk = daftarProduk[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(produk: produk)),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAlias, // Huruf kecil (sudah diperbaiki)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          // Ganti errorBuilder jika gambar belum ada agar tidak error merah di layar HP
                          image: AssetImage(produk.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          produk.nama,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${produk.harga}',
                          style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    final Widget tabProfil = Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: Colors.pink,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pinkAccent, Colors.pink],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/profil_login.jpeg'), 
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ayesha Humayra Nadra Rafianti', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(height: 4),
                          Text('Mahasiswa Aktif', style: TextStyle(fontSize: 14, color: Colors.white70)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.school, color: Colors.pink),
                      title: Text('Informasi Akademik', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const Divider(height: 1),
                    ListTile(title: const Text('Nomor Induk Mahasiswa (NIM)'), subtitle: const Text('25051204430'), trailing: const Icon(Icons.arrow_forward_ios, size: 14)),
                    const Divider(height: 1),
                    ListTile(title: const Text('Program Studi & Kelas'), subtitle: const Text('Teknik Informatika'), trailing: const Icon(Icons.arrow_forward_ios, size: 14)),
                    const Divider(height: 1),
                    ListTile(title: const Text('Mata Kuliah'), subtitle: const Text('Praktikum Pemrograman Berbasis Platform'), trailing: const Icon(Icons.arrow_forward_ios, size: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink,
                    side: const BorderSide(color: Colors.pink),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('Keluar Akun', style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
            ]),
          ),
        ],
      ),
    );

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [tabBeranda, tabProfil],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
        ],
      ),
    );
  }
}