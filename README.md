# football_shop
## Tugas 7: Elemen Dasar Flutter

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
> Widget tree adalah susunan widget di Flutter yang membentuk tampilan aplikasi. Setiap widget bisa punya widget lain di dalamnya, seperti pohon dengan cabang. Widget di atas disebut parent (induk), dan widget di dalamnya disebut child (anak). Parent bisa mengatur posisi dan bentuk child, sedangkan child mengikuti aturan dari parentnya.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
> Proyek ini memakai beberapa widget, seperti MaterialApp untuk membuat kerangka dasar aplikasi, Scaffold untuk bagian utama halaman, AppBar untuk menampilkan judul di atas, Column dan Row untuk menyusun widget secara vertikal atau horizontal, GridView.count untuk membuat tampilan kotak-kotak, Card dan Container untuk membungkus isi, Text dan Icon untuk tulisan dan gambar ikon, serta InkWell untuk menambahkan efek ketika tombol disentuh.


3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
> MaterialApp digunakan agar aplikasi memakai gaya tampilan dari Material Design, seperti tema warna, tombol, dan navigasi halaman. Biasanya MaterialApp diletakkan di paling atas (root) karena menjadi pembungkus utama semua bagian aplikasi Flutter.


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
> StatelessWidget adalah widget yang isinya tidak bisa berubah, cocok untuk bagian yang tetap seperti teks atau ikon. StatefulWidget adalah widget yang bisa berubah saat ada aksi, seperti tombol yang menambah angka. Kalau kita butuh tampilan yang bisa berubah, pakai StatefulWidget, tapi kalau tidak, bisa pakai StatelessWidget.


5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
> BuildContext adalah alat yang memberi tahu posisi sebuah widget di dalam aplikasi. Flutter memakai BuildContext untuk tahu di mana widget berada dan untuk memanggil fungsi seperti membuka halaman baru atau mengambil warna dari tema. Di dalam fungsi build, BuildContext dipakai agar widget bisa tahu harus menampilkan apa.


6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
> Hot reload membuat kode yang baru disimpan langsung terlihat di aplikasi tanpa menutupnya, dan data sebelumnya masih ada. Sedangkan hot restart memulai ulang aplikasi dari awal dan semua data atau perubahan sementara akan hilang.
