import 'package:eitherapi/data/api_service.dart';
import 'package:eitherapi/data/model/product_detail_model.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  ProductDetail? data;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getProductDetail() async {
    isLoading = true;
    notifyListeners();

    var response = await ApiService().getProductDetail();

    if (response.isRight) {
      data = response.right;
    } else {
      errorMessage = response.left;
    }

    isLoading = false;
    notifyListeners();
  }
}
