**Maira Shasmeen Mazaya 2306245724**

# Tugas 2 PBP

 **1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya :**
 - Stateless Widget adalah widget yang bersifat statis, artinya tampilannya tidak akan berubah setelah dibuat. Biasanya digunakan untuk elemen yang ga memerlukan pembaruan atau interaksi yang mengubah data. Data yang ditampilkin oleh widget ini sifatnya tetap dan tidak akan berubah setelah widget tersebut dibuat, seperti teks atau ikon. Sebaliknya, Stateful Widget itu widget yang bisa berubah selama aplikasi berjalan, biasanya karena ada interaksi dari pengguna atau ada perubahan data. Contohnya adalah tombol yang bisa ditekan, form input, atau tampilan yang berubah saat ada data baru. Jadi Stateless Widget itu untuk elemen yang selalu tetap kalau Stateful Widget untuk elemen yang dapat berubah atau dinamis.

 **2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya :**
 - 

**3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut :**
 - setState() berfungsi untuk memberitau Flutter bahwa ada perubahan yang terjadi pada state widget, sehingga Flutter perlu memperbarui tampilan sesuai perubahan tersebut.
 - Misalnya, kalau variabel counter yang menyimpan jumlah klik pada tombol, maka setiap kali user menekan tombol, setState() akan dipanggil untuk memperbarui tampilan angka di layar. Dengan kata lain, setState() memicu pemanggilan ulang fungsi build() dari widget yang bersangkutan agar tampilan yang baru bisa ditampilkan. Semua variabel yang dapat mempengaruhi tampilan (state) akan terkena efek setState(). Biasanya ini kayak variabel-variabel yang berubah-ubah dan ingin ditampilkan dalam widget.

**4.  Jelaskan perbedaan antara const dengan final :**
 - Const dan Final di Dart digunakan untuk mendefinisikan variabel yang tidak bisa diubah. Perbedaannya yaitu const digunakan ketika kita sudah tahu nilai variabel tersebut sejak awal, misalnya nilai konstan seperti angka atau teks tetap. Variabel ini ga berubah dan harus sudah diketahui saat aplikasi dikompilasi. Sedangkan final adalah variabel yang juga tidak bisa diubah setelah diinisialisasi, tetapi nilainya bisa diatur saat runtime yaitu ketika aplikasi berjalan. Jadi jika ada nilai yang baru bisa kita tentukan saat aplikasi dijalankan, kita akan menggunakan final. Const itu lebih untuk hal-hal yang sudah pasti dari awal, sedangkan final bisa digunakan untuk nilai yang tetap tapi baru diketahui belakangan.

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas :**