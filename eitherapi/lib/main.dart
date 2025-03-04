import 'package:eitherapi/presentation/menu_screen.dart';
import 'package:eitherapi/presentation/product_detail/provider/product_provider.dart';
import 'package:eitherapi/presentation/product_detail/ui/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/product-detail': (context) => ProductDetailScreen()
      },
    );
  }
}
