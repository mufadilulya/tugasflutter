import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 24.0,
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/product-detail');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Center(
                  child: Text(
                    'Product Detail',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
