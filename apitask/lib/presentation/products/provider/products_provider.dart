import 'package:apitask/data/api_service.dart';
import 'package:flutter/widgets.dart';

class ProductsProvider extends ChangeNotifier {
  List data = [];
  bool isLoading = false;

  void getProducts() async {
    isLoading = true;
    notifyListeners();

    data = await ApiService().getProducts();
    isLoading = false;
    notifyListeners();
  }
}
