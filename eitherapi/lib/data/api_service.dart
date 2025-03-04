import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:eitherapi/data/model/product_detail_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Either<String, ProductDetail>> getProductDetail() async {
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/1'));

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Right(ProductDetail.fromJson(data));
      } else {
        return Left('Gagal Mengambil Data');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
