import 'package:darss_80/model/product.dart';
import 'package:dio/dio.dart';

/// `ProductRepository` - Bu sinf mahsulotlar bilan bog'liq bo'lgan barcha API chaqiriqlarini boshqaradi.
class ProductRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1'));

  /// `fetchProducts` - Bu funksiya barcha mahsulotlarni serverdan oladi.
  ///
  /// - `await _dio.get('/products')` - API ga GET so'rovi yuboriladi.
  /// - `response.data as List` - Javobdagi ma'lumotlar ro'yxatga aylantiriladi.
  /// - `map((product) => Product.fromJson(product)).toList()` - Har bir mahsulot JSON obyektidan `Product` obyektiga aylantiriladi va ro'yxat qilib qaytariladi.
  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('/products');
    return (response.data as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  /// `addProduct` - Bu funksiya yangi mahsulotni serverga qo'shadi.
  ///
  /// - `await _dio.post('/products', data: product.toJson())` - API ga POST so'rovi yuboriladi va yangi mahsulotning ma'lumotlari JSON formatida yuboriladi.
  /// - `Product.fromJson(response.data)` - Javobdagi ma'lumotlardan yangi `Product` obyektini qaytaradi.
  Future<Product> addProduct(Product product) async {
    final response = await _dio.post('/products', data: product.toJson());
    return Product.fromJson(response.data);
  }

  /// `updateProduct` - Bu funksiya mavjud mahsulotni serverda yangilaydi.
  ///
  /// - `await _dio.put('/products/$id', data: product.toJson())` - API ga PUT so'rovi yuboriladi va yangilangan mahsulotning ma'lumotlari JSON formatida yuboriladi.
  /// - `Product.fromJson(response.data)` - Javobdagi ma'lumotlardan yangilangan `Product` obyektini qaytaradi.
  Future<Product> updateProduct(int id, Product product) async {
    final response = await _dio.put('/products/$id', data: product.toJson());
    return Product.fromJson(response.data);
  }

  /// `deleteProduct` - Bu funksiya mavjud mahsulotni serverdan o'chiradi.
  ///
  /// - `await _dio.delete('/products/$id')` - API ga DELETE so'rovi yuboriladi va mahsulotning ID si orqali mahsulot o'chiriladi.
  Future<void> deleteProduct(int id) async {
    await _dio.delete('/products/$id');
  }
}
