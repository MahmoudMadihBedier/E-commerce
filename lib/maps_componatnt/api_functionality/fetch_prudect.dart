import 'dart:convert';
import 'package:http/http.dart' as http;
import '../product_map.dart';
// import 'product_model.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = jsonDecode(response.body);
      List<Product> products = jsonResponse.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
