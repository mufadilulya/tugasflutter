import 'package:apitask/presentation/menu_screen.dart';
import 'package:apitask/presentation/products/provider/products_provider.dart';
import 'package:apitask/presentation/products/ui/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        )
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
        '/products': (context) => ProductsScreen(),
      },
    );
  }
}
