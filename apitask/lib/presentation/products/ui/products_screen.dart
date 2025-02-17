import 'package:apitask/presentation/products/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
              onPressed: () {
                context.read<ProductsProvider>().getProducts();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, state, child) {
          return state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(state.data[index]['image']),
                      title: Text(state.data[index]['title']),
                      subtitle: Text(state.data[index]['description']),
                      trailing: Text(state.data[index]['price'].toString()),
                    );
                  },
                  itemCount: state.data.length,
                );
        },
      ),
    );
  }
}
