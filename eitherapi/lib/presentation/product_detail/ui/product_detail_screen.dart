import 'package:eitherapi/presentation/product_detail/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ProductProvider>().getProductDetail();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Consumer<ProductProvider>(builder: (context, state, child) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.errorMessage != '') {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Column(
            children: [
              Text(
                state.data?.title ?? '',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                state.data?.price.toString() ?? '',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text(state.data?.description ?? '')
            ],
          );
        }
      }),
    );
  }
}
