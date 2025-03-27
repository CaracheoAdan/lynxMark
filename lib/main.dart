import 'package:flutter/material.dart';
import 'package:lince_market/screens/login_screen.dart';
import 'package:lince_market/screens/product_catalog_screen.dart';
import 'package:lince_market/screens/product_filter_screen.dart';
import 'package:lince_market/screens/register_seller_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de debug
      title: 'Lince Market',
      theme: ThemeData(
        primaryColor: Color(0xFF004AAD), // Azul universitario
      ),
      home: ProductFilterScreen(), // Muestra la pantalla de login al iniciar
    );
  }
}