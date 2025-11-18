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

--------------------------------------------------------------------

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
> Navigator push dipakai untuk membuka halaman baru tanpa nutup halaman sebelumnya jadi bisa balik lagi ke halaman lama sementara Navigator pushReplacement ganti halaman lama dengan halaman baru jadi tidak bisa balik lagi di Football Shop push dipakai saat membuka halaman create product atau lihat produk supaya bisa kembali ke menu sedangkan pushReplacement bisa dipakai kalau mau pindah ke halaman utama setelah login.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
> Scaffold AppBar dan Drawer dipakai supaya semua halaman punya bentuk dan posisi elemen yang sama Scaffold jadi kerangka utama tempat body dan appbar AppBar dipakai untuk memberi judul halaman dengan warna yang sama Drawer dipakai untuk navigasi antarhalaman seperti ke menu utama atau tambah produk jadi semua halaman Football Shop terasa satu kesatuan dan rapih.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
> Padding dipakai untuk memberi jarak antar elemen biar tidak menempel SingleChildScrollView dipakai supaya halaman bisa digulir kalau form terlalu panjang dan tidak muat di layar ListView dipakai kalau mau tampilkan banyak elemen seperti daftar produk di Football Shop widget ini dipakai di halaman tambah produk supaya semua input bisa diakses dengan mudah tanpa ketumpuk di layar kecil.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
> Warna tema diset lewat ThemeData supaya semua halaman punya warna yang sama dan sesuai dengan identitas toko di Football Shop warna utama yang dipakai adalah indigo yang muncul di AppBar tombol dan ikon ini bikin tampilan aplikasi terlihat seragam rapih dan mencerminkan warna khas brand toko.

----------------------------------------------------------------

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
> Model Dart penting untuk mengubah data JSON mentah menjadi objek dengan tipe data yang jelas dan terstruktur. Tanpa model kita harus mengakses data dengan Map yang rawan error karena tidak ada validasi tipe, misalnya bisa salah tulis key name jadi nama dan error baru ketahuan saat runtime. Model juga memberikan null safety otomatis sehingga kita tahu field mana yang bisa null atau tidak, dan kode jadi lebih mudah dimaintain karena jika struktur data berubah kita tinggal update model di satu tempat saja.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
> Package http adalah library standar Flutter untuk melakukan HTTP request seperti GET dan POST ke server, tapi tidak mengelola cookie atau session secara otomatis. Sementara CookieRequest dari package pbp_django_auth adalah wrapper khusus yang otomatis menyimpan dan mengirimkan cookie session di setiap request sehingga Django bisa mengenali bahwa request berasal dari user yang sama dan sudah login. Dalam tugas ini CookieRequest kita pakai untuk login, register, dan operasi lain yang butuh user authentication karena bisa maintain session seperti browser.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
> Instance CookieRequest harus dibagikan ke seluruh aplikasi menggunakan Provider agar semua halaman menggunakan session cookie yang sama dan user tidak perlu login ulang di setiap halaman. Kalau setiap komponen buat instance CookieRequest sendiri sendiri maka cookie session tidak akan tershare dan user sudah login di halaman A tapi pas pindah ke halaman B dianggap belum login karena pakai cookie berbeda. Dengan membuat satu instance di root widget dan dibagikan lewat Provider semua child widget bisa akses session yang sama jadi status login tetap konsisten di seluruh aplikasi.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
> Konfigurasi 10.0.2.2 di ALLOWED_HOSTS diperlukan karena Android emulator menggunakan IP khusus tersebut untuk mengakses localhost komputer host dan tanpa ini Django akan reject request dari emulator. CORS harus diaktifkan karena Flutter dianggap sebagai origin berbeda dari Django dan tanpa CORS browser akan block request sebagai security measure. Setting SameSite Lax dan cookie secure False untuk development memastikan cookie bisa dikirim antar aplikasi, sedangkan permission internet di AndroidManifest.xml wajib agar Android tidak block network request. Kalau konfigurasi ini salah aplikasi akan gagal connect ke Django dengan error seperti Connection refused atau CORS policy error.
 
5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
> Proses dimulai ketika user mengisi form di Flutter misalnya ProductFormPage, lalu data diambil dari controller dan divalidasi dengan formKey. Setelah valid data dikemas dalam format JSON menggunakan jsonEncode dan dikirim ke Django endpoint create-flutter via request.postJson. Di Django view function create_product_flutter menerima request, parse JSON dengan json.loads, buat instance Product baru dan save ke database. Django kembalikan response JSON status success yang diterima Flutter, lalu Flutter cek response tersebut dan kalau sukses tampilkan SnackBar berhasil disimpan dan redirect ke home dimana data product terbaru difetch dari endpoint json dan ditampilkan menggunakan FutureBuilder dengan ListView.
 
6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
> Untuk register user isi username dan password di RegisterPage Flutter, data dikirim ke auth/register via postJson, Django buat user baru dengan User.objects.create_user lalu return JSON success. Untuk login user input credentials di LoginPage, dikirim ke auth/login via request.login, Django cek dengan authenticate dan jika valid panggil auth_login untuk create session lalu return cookie session dalam response yang otomatis disimpan CookieRequest. Setelah login berhasil Flutter cek request.loggedIn yang true karena ada cookie lalu navigate ke MyHomePage dimana semua request berikutnya otomatis include cookie session sehingga Django tahu user mana yang request. Untuk logout Flutter panggil auth/logout yang trigger auth_logout di Django untuk destroy session, cookie dihapus dan Flutter navigate kembali ke LoginPage.
 
7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
> Pertama saya buat app authentication di Django lalu tambahkan ke INSTALLED_APPS dan install django-cors-headers untuk handle CORS. Saya setup CORS di settings.py dengan CORS_ALLOW_ALL_ORIGINS true, ALLOWED_HOSTS ditambah 10.0.2.2, dan cookie settings disesuaikan untuk development. Di authentication/views.py saya buat fungsi login register dan logout dengan decorator csrf_exempt yang return JsonResponse kemudian routing di authentication/urls.py. Di Flutter saya install pbp_django_auth dan provider, wrap MaterialApp dengan Provider di main.dart untuk share CookieRequest, lalu buat login.dart dan register.dart yang akses request.login dan request.postJson dengan URL http 10.0.2.2 8000. Untuk product saya generate model Dart dari JSON di Quicktype, buat ProductFormPage dengan form fields yang kirim data ke Django endpoint create-flutter, dan buat function create_product_flutter di Django yang parse JSON dan save Product. Terakhir saya test dengan Android emulator karena Chrome web punya CORS issue, register user baru login lalu create product dan semuanya berhasil setelah memastikan Django server running.