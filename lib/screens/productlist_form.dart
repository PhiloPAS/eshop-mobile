import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  String _category = "jersey";
  String _thumbnail = "";
  bool _isFeatured = false;
  double? _price;

  final List<String> _categories = [
    'jersey',
    'ball',
    'accessory',
    'shoes',
    'training',
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama produk",
                    labelText: "Name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) => setState(() => _name = val.trim()),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Nama produk tidak boleh kosong';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga (contoh: 150000)",
                    labelText: "Price",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => setState(() => _price = double.tryParse(val.replaceAll(',', '').trim())),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Harga tidak boleh kosong';
                    final parsed = double.tryParse(val.replaceAll(',', '').trim());
                    if (parsed == null) return 'Harga harus berupa angka';
                    if (parsed <= 0) return 'Harga harus lebih besar dari 0';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Deskripsi produk",
                    labelText: "Description",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) => setState(() => _description = val.trim()),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Deskripsi tidak boleh kosong';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  initialValue: _category,
                  items: _categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c[0].toUpperCase() + c.substring(1))))
                      .toList(),
                  onChanged: (val) => setState(() => _category = val ?? _category),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Category tidak boleh kosong';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (contoh: https://...)",
                    labelText: "Thumbnail URL",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) => setState(() => _thumbnail = val.trim()),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Thumbnail tidak boleh kosong';
                    final uri = Uri.tryParse(val.trim());
                    if (uri == null || (!uri.isAbsolute)) return 'Masukkan URL yang valid (contoh: https://...)';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Produk Unggulan"),
                  value: _isFeatured,
                  onChanged: (val) => setState(() => _isFeatured = val),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // TODO: Replace the URL with your app's URL
                        // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                        // If you using chrome,  use URL http://localhost:8000
                        
                        final response = await request.postJson(
                          "http://10.0.2.2:8000/create-flutter/",
                          jsonEncode({
                            "name": _name, // Mengubah "title" menjadi "name"
                            "description": _description, // Mengubah "content" menjadi "description"
                            "price": _price, // Menambahkan "price"
                            "thumbnail": _thumbnail,
                            "category": _category,
                            "is_featured": _isFeatured,
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Produk berhasil disimpan!"), // Mengubah pesan SnackBar
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()), // MyHomePage() mengacu pada 'package:football_shop/screens/menu.dart'
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Terjadi kesalahan, silakan coba lagi."), // Mengubah pesan SnackBar
                            ));
                          }
                        }
                      }
                    },
                    child: const Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}