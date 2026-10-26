import 'package:flutter/material.dart';
import 'models/product_model.dart';

class DetailPage extends StatefulWidget {
  final ProductModel produk;

  const DetailPage({super.key, required this.produk});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  String? selectedWarna;
  late String currentImagePath;

  @override
  void initState() {
    super.initState();
    currentImagePath = widget.produk.imagePath;
    final listWarna = widget.produk.warna ?? [];
    final listMotif = widget.produk.motif ?? [];
    if (listWarna.isNotEmpty) {
      selectedWarna = listWarna[0];
    } else if (listMotif.isNotEmpty) {
      selectedWarna = listMotif[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final listWarna = widget.produk.warna ?? [];
    final listMotif = widget.produk.motif ?? [];
    bool hasWarna = listWarna.isNotEmpty;
    bool hasMotif = listMotif.isNotEmpty;
    List<String> pilihanList = hasWarna ? listWarna : listMotif;
    final listGambar = widget.produk.listGambar ?? [];
    final listUlasan = widget.produk.ulasan ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        title: const Text('Detail Produk', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Utama Produk
            Container(
              height: 350,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                currentImagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            // Informasi Nama & Harga
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produk.nama,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${widget.produk.harga}',
                    style: const TextStyle(fontSize: 22, color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text('${widget.produk.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 16),
                      Text('Stok: ${widget.produk.stok}', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Bagian Pilihan Warna / Motif dengan Gambar Variasi
            if (pilihanList.isNotEmpty)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hasWarna ? 'Pilih Warna:' : 'Pilih Motif:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: List.generate(pilihanList.length, (index) {
                        String pilihan = pilihanList[index];
                        bool isSelected = selectedWarna == pilihan;

                        // Mengambil gambar variasi secara aman
                        String gambarVariasi = (listGambar.length > index)
                            ? listGambar[index]
                            : widget.produk.imagePath;

                        return ChoiceChip(
                          selected: isSelected,
                          selectedColor: Colors.pink.shade100,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
                          ),
                          avatar: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              gambarVariasi,
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                          ),
                          label: Text(
                            pilihan,
                            style: TextStyle(
                              color: isSelected ? Colors.pink.shade900 : Colors.black87,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          onSelected: (bool selected) {
                            setState(() {
                              selectedWarna = pilihan;
                              currentImagePath = gambarVariasi;
                            });
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),

            // Ulasan Pengguna
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ulasan Pembeli', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  listUlasan.isNotEmpty
                      ? Column(
                          children: listUlasan.map((ulasan) {
                            return ListTile(
                              leading: const Icon(Icons.person_outline, color: Colors.pink),
                              title: Text(ulasan),
                              dense: true,
                            );
                          }).toList(),
                        )
                      : const Text('Belum ada ulasan untuk produk ini.', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Berhasil memesan ${widget.produk.nama} (${selectedWarna ?? 'Default'})!')),
                  );
                },
                child: const Text('Beli Sekarang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}