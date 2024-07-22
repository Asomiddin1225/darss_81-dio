import 'package:darss_80/model/product.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1'));

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('/products');
    return (response.data as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  Future<Product> addProduct(Product product) async {
    final response = await _dio.post('/products', data: product.toJson());
    return Product.fromJson(response.data);
  }

  Future<Product> updateProduct(int id, Product product) async {
    final response = await _dio.put('/products/$id', data: product.toJson());
    return Product.fromJson(response.data);
  }

  Future<void> deleteProduct(int id) async {
    await _dio.delete('/products/$id');
  }
}
