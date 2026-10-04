import 'package:flutter/material.dart';
import 'models/product_model.dart';

class CheckoutPage extends StatefulWidget {
  final ProductModel produk;
  final String variasiPilihan;

  const CheckoutPage({
    super.key,
    required this.produk,
    required this.variasiPilihan,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _metodePembayaran = 'COD';
  String? _bankPilihan; // Variabel untuk menyimpan pilihan bank

  // Daftar bank untuk dropdown
  final List<String> _daftarBank = [
    'Bank BRI',
    'Seabank',
    'BCA',
    'Mandiri',
    'Bank BNI',
    'Bank Syariah Islam (BSI)',
    'Bank Permata',
    'Bank CIMB Niaga'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= SECTION 1: Alamat Pengiriman =================
            const Text(
              'Alamat Pengiriman',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: Rafsha', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text('No HP: 081213052506', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 4),
                  Text('Alamat: Jl. AhmadYani Surabaya Jawa Timur',
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),

            // ================= SECTION 2: Ringkasan Produk =================
            const Text(
              'Ringkasan Produk',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.produk.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.produk.nama,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 4),
                      Text(
                        widget.variasiPilihan,
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Rp ${widget.produk.harga}',
                  style: const TextStyle(color: Color(0xFFE91E63), fontSize: 13),
                ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),

            // ================= SECTION 3: Metode Pembayaran =================
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            
            // --- Opsi 1: COD ---
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Cash on Delivery (COD)',
                  style: TextStyle(fontSize: 14)),
              value: 'COD',
              groupValue: _metodePembayaran,
              activeColor: const Color(0xFFE91E63),
              onChanged: (value) {
                setState(() {
                  _metodePembayaran = value.toString();
                });
              },
            ),
            
            // --- Opsi 2: Transfer Bank ---
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Transfer Bank', style: TextStyle(fontSize: 14)),
              value: 'Transfer',
              groupValue: _metodePembayaran,
              activeColor: const Color(0xFFE91E63),
              onChanged: (value) {
                setState(() {
                  _metodePembayaran = value.toString();
                });
              },
            ),
            // Tampilan Dropdown Bank (Hanya muncul jika Transfer Bank dipilih)
            if (_metodePembayaran == 'Transfer')
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  hint: const Text('Pilih Bank'),
                  value: _bankPilihan,
                  items: _daftarBank.map((String bank) {
                    return DropdownMenuItem<String>(
                      value: bank,
                      child: Text(bank, style: const TextStyle(fontSize: 14)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _bankPilihan = newValue;
                    });
                  },
                ),
              ),

            // --- Opsi 3: QRIS ---
            RadioListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('QRIS', style: TextStyle(fontSize: 14)),
              value: 'QRIS',
              groupValue: _metodePembayaran,
              activeColor: const Color(0xFFE91E63),
              onChanged: (value) {
                setState(() {
                  _metodePembayaran = value.toString();
                });
              },
            ),
            // Tampilan Gambar Barcode QRIS (Hanya muncul jika QRIS dipilih)
            if (_metodePembayaran == 'QRIS')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Scan QR Code di bawah ini:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Image.asset(
                        'assets/images/qris.jpeg', // Pastikan path asset QRIS Anda sesuai
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE91E63),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            // Validasi sebelum membuat pesanan
            if (_metodePembayaran == 'Transfer' && _bankPilihan == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Silakan pilih Bank terlebih dahulu!')),
              );
              return;
            }
            
            // Aksi tombol Buat Pesanan
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Pesanan berhasil dibuat!')),
            );
          },
          child: const Text('Buat Pesanan',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}