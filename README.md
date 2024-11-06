**Maira Shasmeen Mazaya 2306245724**

# Tugas 2 PBP

 **1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya :**
 - Stateless Widget adalah widget yang bersifat statis, artinya tampilannya tidak akan berubah setelah dibuat. Biasanya digunakan untuk elemen yang ga memerlukan pembaruan atau interaksi yang mengubah data. Data yang ditampilkin oleh widget ini sifatnya tetap dan tidak akan berubah setelah widget tersebut dibuat, seperti teks atau ikon. Sebaliknya, Stateful Widget itu widget yang bisa berubah selama aplikasi berjalan, biasanya karena ada interaksi dari pengguna atau ada perubahan data. Contohnya adalah tombol yang bisa ditekan, form input, atau tampilan yang berubah saat ada data baru. Jadi Stateless Widget itu untuk elemen yang selalu tetap kalau Stateful Widget untuk elemen yang dapat berubah atau dinamis.

 **2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya :**
 - Di proyek Flutter ini, halaman utamanya menggunakan *Scaffold* untuk menyediakan struktur dasar dari aplikasi, seperti header *AppBar* dan bagian *body* untuk menampilkan konten utama. AppBar digunakan untuk menampilkan judul "shtoree" di bagian atas, dengan teks putih dan tebal yang memberikan kesan bersih dan profesional. Warna latar belakang dari AppBar diambil dari tema aplikasi, memastikan tampilannya serasi dengan keseluruhan aplikasi.
 - Di bagian *body*, ada elemen *Padding* yang memberikan jarak di sekeliling konten supaya tampilan tidak terasa terlalu penuh dan lebih nyaman dilihat. Konten di dalam body disusun menggunakan *Column* untuk menyusun elemen-elemen secara vertikal. Ada *Row* di dalamnya yang menampilkan tiga *InfoCard* secara berdampingan, berisi informasi penting seperti *NPM*, *Name*, dan *Class*. Ini membantu menampilkan data pengguna dengan rapi dan jelas.
 - Selain itu, terdapat *GridView.count* yang digunakan untuk menampilkan tombol-tombol seperti "Lihat Daftar Produk", "Tambah Produk", dan "Logout" dalam bentuk grid tiga kolom. Setiap tombol direpresentasikan sebagai *ItemCard* yang berisi ikon dan teks. Setiap *ItemCard* ini menggunakan *InkWell* untuk memberikan efek interaktif, sehingga ketika pengguna menekan tombol, mereka akan mendapatkan umpan balik berupa *SnackBar* yang menampilkan pesan seperti "Kamu telah menekan tombol Lihat Daftar Produk!" atau tombol lainnya.
 - Aplikasi ini juga diatur dengan menggunakan *MaterialApp* yang memiliki *ThemeData* untuk menentukan warna utama dan sekunder. Warna-warna ini, seperti merah yang dipilih di sini, memberikan nuansa konsisten di seluruh aplikasi, yang membuat tampilan lebih menyatu dan profesional. Dengan elemen-elemen ini, aplikasi "shtoree" memberikan pengalaman pengguna yang jelas, teratur, dan menyenangkan untuk digunakan.

 **3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut :**
 - setState() berfungsi untuk memberitau flutter bahwa ada perubahan yang terjadi pada state widget, sehingga flutter perlu memperbarui tampilan sesuai perubahan tersebut.
 - Misalnya, kalau variabel counter yang menyimpan jumlah klik pada tombol, maka setiap kali user menekan tombol setState() akan dipanggil untuk memperbarui tampilan angka di layar. Dengan kata lain, setState() memicu pemanggilan ulang fungsi build() dari widget yang bersangkutan agar tampilan yang baru bisa ditampilkan. Semua variabel yang dapat mempengaruhi tampilan (state) akan terkena efek setState(). Biasanya ini kayak variabel-variabel yang berubah-ubah dan ingin ditampilkan dalam widget.

 **4.  Jelaskan perbedaan antara const dengan final :**
 - Const dan Final di Dart digunakan untuk mendefinisikan variabel yang tidak bisa diubah. Perbedaannya yaitu const digunakan ketika kita sudah tahu nilai variabel tersebut sejak awal, misalnya nilai konstan seperti angka atau teks tetap. Variabel ini ga berubah dan harus sudah diketahui saat aplikasi dikompilasi. Sedangkan final adalah variabel yang juga tidak bisa diubah setelah diinisialisasi, tetapi nilainya bisa diatur saat runtime yaitu ketika aplikasi berjalan. Jadi jika ada nilai yang baru bisa kita tentukan saat aplikasi dijalankan, kita akan menggunakan final. Const itu lebih untuk hal-hal yang sudah pasti dari awal, sedangkan final bisa digunakan untuk nilai yang tetap tapi baru diketahui belakangan.

 **5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas :**
 - Pertama saya membuat flutter baru dengan nama shtoree, dan juga git baru dengan nama shtoree-mobile
 - Kedua saya menambahkan file barau bernama menu.dart pada direktori lib dan melakukan modifikasi seperti yang dijelaskan pada tutorial, saya juga menambahkan card untuk nama npm kelas
 - Ketiga saya mengedit bagian tombol seperti yang disuruh yaitu tombol Lihat Daftar Produk, Tambah Produk, Logout. Terdapat baian untuk mendefinisikan class itemHomepage untuk tiap tombol. Pada class tersebut akan disimpan nama tombol dan ikon seperti berikut
 ```bash
    class ItemHomepage {
      final String name;
      final IconData icon;
     ItemHomepage(this.name, this.icon);
 }
 ```
 - Keempat saya mmenambahkan daftar items di myHomepgae yang berisi tiga instance itemHomepage dan menentukan ikon untuk masing-masing tombol sesuai dengan yang dibutuhkan seperti
 ```bash
    final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.mood),    
        ItemHomepage("Tambah Produk", Icons.add),
        ItemHomepage("Logout", Icons.logout),
    ];
 ```
 - Kelima saya membuat widget stateless bernama ItemCard yang menerima sebuah ItemHomepage dan menampilkannya sebagai tombol.
 - Keenam, agar saat tombol ditekan bisa menampilkan pesan, saya menggunakan ScaffoldMessenger.of(context). ScaffoldMessenger ini adalah widget yang mengelola tampilan Snackbar. Setelah mendapatkan instance dari ScaffoldMessenger, saya memanfaatkan metode showSnackBar untuk menampilkan Snackbar di layar. Dalam membuat Snackbar, saya membuat objek SnackBar yang berisi teks atau widget lain sebagai konten. Pesan Snackbar ini kemudian saya tambahkan pada onTap agar pesan tersebut muncul setiap kali tombol ditekan.
 ```bash
    child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
 ```
 - Terakhir saya menampilkan tombol ini dalam GridView pada MyHomePage agar ItemCard muncul dalam format grid, sehingga tombol-tombol tersebut tersusun rapi dan mudah diakses.
