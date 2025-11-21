# 📘 Jawaban Teori – Pemrograman Mobile (Cubit & Bloc)

## A. Jawaban Teori (3 Soal × 10 Poin)

---

## 1️⃣ Perbedaan Cubit vs Bloc

### **Cubit**
- Cubit adalah *state management* sederhana dari package `flutter_bloc`.
- Menggunakan **fungsi biasa** untuk mengubah state.
- Lebih mudah dipahami dan lebih sedikit boilerplate.
- Biasanya dipakai untuk kasus simple–medium.

**Ciri utama:**
- Memancarkan state menggunakan `emit()`.
- Tidak membutuhkan event.

---

### **Bloc**
- Bloc menggunakan **Event → Logic → State**.
- Lebih cocok untuk aplikasi besar dan alur logika kompleks.
- Memisahkan input (event) dan output (state) dengan lebih jelas.
- Membantu menulis kode yang scalable dan mudah diuji.

**Ciri utama:**
- Harus membuat **Event** dan **State**.
- Cocok untuk aplikasi dengan banyak proses kompleks.

---

### **Kesimpulan Singkat**
| Aspek | Cubit | Bloc |
|------|-------|------|
| Kompleksitas | Sederhana | Lebih kompleks |
| Cara kerja | Fungsi langsung → state | Event → Logic → State |
| Boilerplate | Sedikit | Banyak |
| Cocok untuk | State ringan–menengah | Proyek besar & kompleks |

---

## 2️⃣ Kenapa Penting Memisahkan Model – Bisnis – UI?

Memisahkan **Model, Business Logic, dan UI** itu penting karena:

### ✅ **1. Kode Lebih Rapi & Terstruktur**
Setiap bagian memiliki tugas jelas:
- Model → struktur data  
- Business Logic → proses / aturan aplikasi  
- UI → tampilan  

Tidak tercampur, sehingga mudah dibaca.

### ✅ **2. Mudah Di-maintain**
Kalau ada perubahan:
- Update logika → tidak mengganggu UI
- Update UI → tidak mengubah logika

Aplikasi lebih stabil dan tidak mudah error.

### ✅ **3. Reusable & Scalable**
Business logic bisa dipakai ulang pada banyak halaman.

### ✅ **4. Mudah Diuji (Unit Test)**
Karena logic terpisah, pengujian lebih mudah dilakukan tanpa memikirkan UI.

### **Kesimpulan:**  
Pemecahan ini mengikuti konsep **Clean Architecture** sehingga aplikasi lebih profesional.

---

## 3️⃣ Contoh Minimal 3 State untuk CartCubit + Fungsinya

Berikut contoh state sederhana untuk keranjang belanja (**CartCubit**):

### **A. `CartInitial`**
- State awal saat keranjang masih kosong.
- Digunakan ketika aplikasi baru dibuka.

### **B. `CartUpdated`**
- Muncul setiap ada perubahan barang (tambah/kurang/hapus).
- Menyimpan daftar item dan total harga terbaru.

### **C. `CartError`**
- Digunakan ketika terjadi error, misalnya:
  - gagal menambah item,
  - jumlah item tidak valid,
  - stok habis.

---

## 📦 Contoh Fungsi dalam CartCubit

```dart
class CartCubit extends Cubit<CartState> {
  List<Item> items = [];

  CartCubit() : super(CartInitial());

  void addItem(Item item) {
    try {
      items.add(item);
      emit(CartUpdated(items: items));
    } catch (e) {
      emit(CartError("Gagal menambah item"));
    }
  }

  void removeItem(Item item) {
    try {
      items.remove(item);
      emit(CartUpdated(items: items));
    } catch (e) {
      emit(CartError("Gagal menghapus item"));
    }
  }

  void clearCart() {
    items.clear();
    emit(CartUpdated(items: items));
  }
}
