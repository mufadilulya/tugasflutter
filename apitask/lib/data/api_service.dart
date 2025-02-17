import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List> getProducts() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed To Load Products');
    }
  }
}
