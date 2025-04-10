import 'package:flutter/material.dart';
import 'package:lince_market/screens/account_type_screen.dart';
import 'package:lince_market/screens/analysis_panel_screen.dart';
import 'package:lince_market/screens/login_screen.dart';
import 'package:lince_market/screens/product_catalog_screen.dart';
import 'package:lince_market/screens/product_filter_screen.dart';
import 'package:lince_market/screens/register_buyer_screen.dart';
import 'package:lince_market/screens/register_seller_screen.dart';
import 'package:lince_market/screens/ProductReviewScreen.dart';
import 'package:lince_market/screens/chat_screen.dart';
import 'package:lince_market/screens/SupportFormScreen.dart';
import 'package:lince_market/screens/upload_products_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lince Market',
      theme: ThemeData(
        primaryColor: Color(0xFF004AAD),
      ),
      home: LoginScreen(), // Pantalla principal actualizada

      // Agrega las rutas aquí:
      routes: {
        '/analysis': (_) => AnalysisPanelScreen(),
        '/login': (_) => LoginScreen(),
        '/catalog': (_) => ProductCatalogScreen(),
        '/filter': (_) => ProductFilterScreen(),
        '/register': (_) => RegisterSellerScreen(),
        '/reviews': (_) => ProductReviewScreen(),
        '/form': (_) => SupportFormScreen(),
        '/upload': (_) => UploadProductsScreen(),
      },
    );
  }
}
