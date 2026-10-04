class ProductModel {
  final String nama;
  final String kategori;
  final int harga;
  final String imagePath;
  final int stok;
  final List<String> warna;  
  final List<String>? motif; 
  final double rating;
  final List<String> ulasan;
  final List<String>? listGambar; 

  ProductModel({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.imagePath,
    required this.stok,
    required this.warna,
    this.motif,
    required this.rating,
    required this.ulasan,
    this.listGambar, 
  });
}