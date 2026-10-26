import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Status centang dan jumlah produk di keranjang
  bool isStore1Checked = false;
  int qty1 = 1;
  final int price1 = 42107;

  bool isStore2Checked = false;
  int qty2 = 1;
  final int price2 = 39990;

  bool isAllChecked = false;

  void _toggleAll(bool? value) {
    setState(() {
      isAllChecked = value ?? false;
      isStore1Checked = isAllChecked;
      isStore2Checked = isAllChecked;
    });
  }

  int get totalHarga {
    int total = 0;
    if (isStore1Checked) total += price1 * qty1;
    if (isStore2Checked) total += price2 * qty2;
    return total;
  }

  int get totalSelected {
    int count = 0;
    if (isStore1Checked) count += qty1;
    if (isStore2Checked) count += qty2;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Keranjang Saya (48)', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Ubah', style: TextStyle(color: Colors.black87)),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // TOKO 1: Olshop Pinggir Jalan
          Card(
            color: Colors.white,
            elevation: 0.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.deepOrange,
                        value: isStore1Checked,
                        onChanged: (val) {
                          setState(() {
                            isStore1Checked = val ?? false;
                            isAllChecked = isStore1Checked && isStore2Checked;
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(4)),
                        child: const Text('Star+', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      const Text('Olshop Pinggir Jalan', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.deepOrange,
                        value: isStore1Checked,
                        onChanged: (val) {
                          setState(() {
                            isStore1Checked = val ?? false;
                          });
                        },
                      ),
                      Image.asset('assets/images/rajut_strip.jpeg', width: 70, height: 70, fit: BoxFit.cover),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Cardigan Kancing Bunga...', style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
                              child: const Text('Hitam, L', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            ),
                            const SizedBox(height: 6),
                            Text('Rp $price1', style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (qty1 > 1) qty1--;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                                  child: const Icon(Icons.remove, size: 14),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))),
                                child: Text('$qty1', style: const TextStyle(fontSize: 12)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    qty1++;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                                  child: const Icon(Icons.add, size: 14),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // TOKO 2: Local_Brand Bandung
          Card(
            color: Colors.white,
            elevation: 0.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.deepOrange,
                        value: isStore2Checked,
                        onChanged: (val) {
                          setState(() {
                            isStore2Checked = val ?? false;
                            isAllChecked = isStore1Checked && isStore2Checked;
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.deepOrange, borderRadius: BorderRadius.circular(4)),
                        child: const Text('Star+', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      const Text('Local_Brand Bandung', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.deepOrange,
                        value: isStore2Checked,
                        onChanged: (val) {
                          setState(() {
                            isStore2Checked = val ?? false;
                          });
                        },
                      ),
                      Image.asset('assets/images/pashmina_viscose.jpg', width: 70, height: 70, fit: BoxFit.cover),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Inner Vest Atasan Wanita...', style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(4)),
                              child: const Text('Putih, Std', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            ),
                            const SizedBox(height: 6),
                            Text('Rp $price2', style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (qty2 > 1) qty2--;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                              child: const Icon(Icons.remove, size: 14),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))),
                            child: Text('$qty2', style: const TextStyle(fontSize: 12)),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                qty2++;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
                              child: const Icon(Icons.add, size: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Bar Checkout
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.deepOrange,
                  value: isAllChecked,
                  onChanged: _toggleAll,
                ),
                const Text('Semua', style: TextStyle(fontSize: 14)),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Rp $totalHarga', style: const TextStyle(color: Colors.deepOrange, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: totalSelected > 0 ? Colors.deepOrange : Colors.grey.shade400,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: totalSelected > 0
                  ? () {
                      // Navigasi ke Simulasi Pembayaran / Sukses Checkout
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Konfirmasi Pembayaran'),
                          content: Text('Lanjutkan pembayaran sebesar Rp $totalHarga untuk $totalSelected produk?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Pembayaran Berhasil! Pesanan masuk ke menu "Dikemas".')),
                                );
                              },
                              child: const Text('Bayar Sekarang', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      );
                    }
                  : null,
              child: Text('Checkout ($totalSelected)', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}