**Maira Shasmeen Mazaya 2306245724**

# Tugas 7 PBP

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

# Tugas 8 PBP

 **1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?**
 - const di Flutter digunakan untuk mendeklarasikan objek atau widget sebagai objek yang bersifat immutable (tidak bisa berubah) dan sudah ditentukan nilai tetapnya sejak compile-time. Keuntungan menggunakan const adalah peningkatan efisiensi karena objek tidak akan dibuat berulang-ulang ketika aplikasi berjalan, dan Flutter dapat menggunakan instance yang sama berulang kali (karena nilai konstanta tidak pernah berubah).
 - Sebaiknya gunakan const ketika nilai dari widget atau objek tersebut sudah diketahui sebelumnya dan tidak akan berubah sepanjang aplikasi berjalan. Contohnya, ketika Anda membuat Text Widget yang isinya tidak akan berubah, Anda bisa mendeklarasikannya dengan const. Sebaiknya tidak menggunakan const jika objek atau widget tersebut memiliki nilai yang bisa berubah, seperti data dari input pengguna atau variabel yang tergantung pada kondisi tertentu.

 **2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!**
 - Column digunakan untuk menyusun widget secara vertikal (dari atas ke bawah), sedangkan Row digunakan untuk menyusun widget secara horizontal (dari kiri ke kanan). Pada aplikasi kita, kita menggunakan Column untuk menyusun widget seperti informasi pengguna (InfoCard) dan grid dari tombol-tombol yang ada.
 - contoh column :
 ```bash
 child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
    const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        'Welcome to shtoree',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    ),
    // Menampilkan grid item secara vertikal dalam sebuah kolom.
    GridView.count(
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: items.map((ItemHomepage item) {
        return ItemCard(item);
      }).toList(),
    ),
  ],
 ),
 ```
 - contoh row:
 ```bash
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
 ),
 ```

 **3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!**
 - Pada tugas ini, elemen input yang saya gunakan adalah:
   - TextFormField untuk menginput name, amount, dan description.
 - Elemen input lain yang tidak digunakan antara lain:
   - Slider, yang bisa digunakan untuk memilih nilai dalam rentang tertentu.
   - Checkbox untuk opsi boolean.
   - DropdownButton untuk memilih dari beberapa opsi yang tersedia.
   - Switch, untuk on/off state. Contoh TextFormField pada form kita:

 **4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?**
 - Untuk mengatur tema dalam aplikasi Flutter, saya menggunakan ThemeData dalam MaterialApp. Ini memungkinkan saya untuk mendefinisikan warna utama (primarySwatch), warna sekunder (secondary), gaya teks, dan elemen lainnya agar aplikasi terlihat konsisten di semua halaman. Dalam aplikasi saya, tema diimplementasikan sebagai berikut:
 ```bash
 theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
  ).copyWith(secondary: const Color(0xFFA11212)),
 ),
 ```
 Dengan begitu warna utama digunakan untuk elemen seperti AppBar dan FloatingActionButton, sementara warna sekunder digunakan untuk elemen lainnya seperti Icon pada ItemCard.


 **5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?**
 - Saya menggunakan Navigator dan MaterialPageRoute untuk menangani navigasi antar halaman. Navigator.push digunakan untuk menambahkan halaman baru ke stack, sehingga pengguna dapat kembali ke halaman sebelumnya menggunakan tombol "Back". Sebagai contoh, ketika pengguna menekan tombol "Tambah Produk", halaman AddItemFormPage dibuka menggunakan Navigator.push:
 ```bash 
 Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const AddItemFormPage(),
  ),
 );
 ```
 Dengan cara ini pengguna bisa menavigasi antar halaman secara fleksibel, dan ketika pengguna menyelesaikan penambahan produk, mereka dapat kembali ke halaman utama dengan mudah menggunakan tombol "Back".

 # Tugas 9 PBP
 **1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**
 - Membuat model untuk mengambil atau mengirim data JSON penting agar data yang digunakan tetap memiliki struktur yang konsisten dan mudah dipahami oleh aplikasi sehingga mengurangi kemungkinan kesalahan saat memproses data. Tanpa model, pengelolaan data akan lebih sulit karena tipe dan struktur data tidak jelas, yang bisa menyebabkan error saat data diakses atau digunakan. Model juga memudahkan proses debugging dan pengembangan karena memberikan panduan yang jelas tentang bagaimana data JSON harus diolah dan dimanfaatkan.

 **2.  Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**
 - Library http pada Flutter digunakan untuk berkomunikasi dengan server. Fungsinya itu untuk mengirimkan permintaan (requests) dan menerima responses dari server, seperti GET, POST, PUT, DELETE, dll. Di tugas ini library http memungkinkan Flutter untuk akases API backend yang ditulis di django, jadi data bisa diambil dari server atau dikirim untuk disimpan. Hal ini penting untuk melakukan proses seperti login, registrasi, pengambilan daftar produk, dan lain-lain.

 **3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**
 - CookieRequest digunakan untuk mengelola login berbasis cookie. Setelah pengguna login, CookieRequest menyimpan data cookie yang diberikan oleh server untuk menjaga sesi tetap aktif. Cookie ini penting untuk memastikan pengguna yang sudah login bisa mengakses bagian lain dari aplikasi yang butuh autentikasi, seperti melihat atau mengedit data. Karena alasan itu, CookieRequest dibagikan ke semua bagian aplikasi agar tiap bagian bisa tahu kalau pengguna sudah login dan menggunakan cookie tersebut untuk setiap permintaan ke server.

 **4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.**
 - Input Data : Pengguna memasukkan data ke form seperti nama produk, harga, dan rating.
 - Mengirim ke Server : Data yang diisi user kemudian dikirim ke server django dengan menggunakan request.postJson(). Ini menggunakan URL endpoint yang sudah disiapkan di backend django.
 - Memproses di Server : django akan menerima data ini dan menyimpannya di database. Misalnya saat pengguna menambahkan review, django akan menyimpan data tersebut sebagai data baru.
 - Menampilkan di Flutter : Setelah data disimpan, server bisa mengirimkan kembali data terbaru, dan Flutter menggunakan FutureBuilder untuk mendapatkan data tersebut dan menampilkannya dalam bentuk list pada halaman "Review List".

 **5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke django hingga selesainya proses autentikasi oleh django dan tampilnya menu pada Flutter.**
 
 A. Login:
  - Pengguna memasukkan username dan password, lalu menekan tombol login.
  - Flutter mengirim data ini ke server django menggunakan request.postJson() ke URL login.
  - django memeriksa apakah username dan password benar. Jika benar, django mengirimkan cookie sesi ke flutter, yang kemudian disimpan di CookieRequest.
  - Setelah itu, pengguna diarahkan ke halaman utama (MyHomePage), dan cookie sesi ini dipakai untuk membuktikan bahwa pengguna sudah login.
 
 B.  Register:
  - Pengguna memasukkan data seperti username dan password.
  - Flutter mengirim data ke endpoint register di django, dan django membuat akun baru untuk pengguna tersebut.
  - Setelah berhasil register, pengguna bisa login menggunakan akun barunya.

 C. Logout:
  - Ketika pengguna menekan tombol logout, flutter menggunakan request.logout() untuk mengirim permintaan logout ke django.
  - django akan menghapus sesi pengguna dan mengembalikan respon berhasil logout.
  - Setelah itu flutter akan menghapus informasi sesi dari CookieRequest dan mengarahkan pengguna kembali ke halaman login.

 **6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**
 - Pertama saya mengimplementasikan registrasi akun dan autentikasi pada Flutter dengan cara membuat authentication app di django. Lalu memodifikasi settings.py di django untuk menambahkan app ini dan juga menginstal dependensi yang diperlukan melalui pip install juga menambahkan requirements.txt.
 - Kedua saya membuat metode view di views.py dalam authentication yang berfungsi untuk menjalankan login dan mengatur urls nya. Untuk integrasi sistem autentikasi pada flutter, saya instal package yang seperti ada pada tutorial, kemudian saya mengubah main.dart saya menjadi seperti berikut:
 ```bash
 import 'package:flutter/material.dart';
import 'package:shtoree/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'shtoree',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
```
dan menambhakan login.dart pada flutter untuk menampilkan halaman login.
- Ketiga menambahkn fungsi register di views.py django authentication  agar dapat melakukan registrasi bagi pengguna baru. Kemudian lanjut membuat screen baru bernama register.dart.
- Untuk membuat model kustom, saya mengakses JSON dari server django lokal saya, kemudian menggunakan situs quicktype untuk mengonversi data JSON menjadi kode dart. Hasil konversi tersebut saya masukkan ke dalam file rating.dart yang ditempatkan di folder models di dalam lib.
- Untuk mengambil data dari django, saya menggunakan command flutter pub add http untuk menambahkan package http pada proyek flutter. Saya juga memodifikasi beberapa file di folder Android sesuai instruksi tutorial untuk mengizinkan akses jaringan.
- Keenam saya membuat halaman baru bernama list_product_rating.dart, yang berisi logika untuk menampilkan daftar review produk. Saya menyesuaikan tampilan ini agar sesuai dengan Django dan Flutter saya. Kemudian saya menambahkan halaman ini ke dalam widget left drawer dan melakukan penyesuaian lainnya pada file lain sehingga halamanmnya dapat diakses melalui menu dan drawer.
- Lalu saya melakukan penyesuaian pada list_product_rating.dart, sehingga setiap kotak item yang dipilih dapat diarahkan ke detail review (rating_detail.dart), code nya jadi gini :
```bash
import pacakge-package

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum ada review pada produk.',
                      style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  Product product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail ketika item di klik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatingDetailPage(product: product),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama produk dengan style tebal
                          Text(
                            product.fields.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Harga produk
                          Text(
                            "Price: Rp ${product.fields.price}",
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Feedback produk
                          Text(
                            product.fields.feedback,
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Rating produk dengan ikon bintang
                          Row(
                            children: [
                              Text(
                                "${product.fields.rating}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.0,
```
- Untuk mengintegrasikan form flutter dengan django, saya memodifikasi file views.py pada django main app dengan menambahkan fungsi create_product_review_flutter. Fungsi ini kemudian dipanggil dari addreview_form.dart di proyek Flutter, dan saya melakukan penyesuaian fungsi lainnya untuk memastikan integrasi antara form flutter dan django dapat berjalan dengan baik.
- Terakhir, saya menambahkan fitur logout yang mekanismenya kurang lebih sama dengan fitur login, menggunakan pbp_django_auth untuk menangani proses autentikasi keluar dari sistem.
- Intinya saya memastikan agar flutter saya erjalan dengan lancar dan sesuai dengan django yang kemarin telaha dibuat.