import 'dart:convert';

import 'package:flipkart_page/product_model.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  Uri url = Uri.parse('https://fakestoreapi.com/products/');

  Future<List<Products>> fetchProduct() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body).cast<Map<String, dynamic>>();
      print(data[0]);
      return data.map<Products>((json) => Products.fromJson(json)).toList();
    } else {
      print('gfsdjshdfsdfs');
      throw Exception('Failed to load products');
    }
  }

  Future<void> add_product(String title, String price, String des, String cat,
      String img, Map rating) async {
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'price': price,
          'description': des,
          'category': cat,
          'image': img,
          'rating': rating
        }));
    if (response.statusCode == 200) {
      print(response.body);
      print('Product added successfully');
    } else {
      print('Product not added');
    }
  }

  Future<void> update_product(String id, String title, String price) async {
    final response = await http.patch(
        Uri.parse('https://fakestoreapi.com/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{'title': title, 'price': price}));
    if (response.statusCode == 200) {
      print(response.body);
      print('Product updated succesfully');
    } else {
      print('Product not updated');
    }
  }

  Future<void> delet_product(String id) async {
    final response = await http.delete(
        Uri.parse('https://fakestoreapi.com/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        });
    if (response.statusCode == 200) {
      print(response.body);
      print('Product Deleted succesfully');
    } else {
      print('Product not Deleted');
    }
  }
}
