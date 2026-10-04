import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'checkout_page.dart';

class DetailPage extends StatefulWidget {
  final ProductModel produk;

  const DetailPage({super.key, required this.produk});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? _warnaPilihan;
  String? _motifPilihan;

  @override
  Widget build(BuildContext context) {
    // 1. Cek apakah produk memiliki variasi WARNA (Wajib menggunakan .isNotEmpty)
    bool adaWarna = widget.produk.warna.isNotEmpty;

    // 2. Cek apakah produk memiliki variasi MOTIF
    bool adaMotif = widget.produk.motif != null && widget.produk.motif!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Image.asset(
              widget.produk.imagePath,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produk.nama,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rp ${widget.produk.harga}',
                    style: const TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  
                  // ================= KOMPONEN WARNA =================
                  // Hanya muncul JIKA list warna ada isinya (.isNotEmpty)
                  if (adaWarna) ...[
                    const Text('Pilih Warna:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      children: widget.produk.warna.map((warna) {
                        return ChoiceChip(
                          label: Text(warna),
                          selected: _warnaPilihan == warna,
                          selectedColor: Colors.pink[100],
                          onSelected: (bool selected) {
                            setState(() {
                              _warnaPilihan = selected ? warna : null;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // ================= KOMPONEN MOTIF =================
                  // Hanya muncul JIKA list motif tidak null dan tidak kosong
                  if (adaMotif) ...[
                    const Text('Pilih Motif:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: widget.produk.motif!.map((motif) {
                        return ChoiceChip(
                          label: Text(motif),
                          selected: _motifPilihan == motif,
                          selectedColor: Colors.pink[100],
                          onSelected: (bool selected) {
                            setState(() {
                              _motifPilihan = selected ? motif : null;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            if (adaWarna && _warnaPilihan == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Silakan pilih warna terlebih dahulu!')),
              );
              return;
            }
            if (adaMotif && _motifPilihan == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Silakan pilih motif terlebih dahulu!')),
              );
              return;
            }

            String variasiTerpilih = '';
            if (adaWarna && _warnaPilihan != null) variasiTerpilih += 'Warna: $_warnaPilihan ';
            if (adaMotif && _motifPilihan != null) variasiTerpilih += 'Motif: $_motifPilihan';
            if (variasiTerpilih.isEmpty) variasiTerpilih = 'Standar';

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(
                  produk: widget.produk,
                  variasiPilihan: variasiTerpilih.trim(),
                ),
              ),
            );
          },
          child: const Text('Beli Sekarang', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }
}