import 'package:flutter/material.dart';

class ProductCatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar productos...'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.black),
            onSelected: (value) {
              Navigator.pushNamed(context, value);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: '/analysis', child: Text('Análisis')),
              PopupMenuItem(value: '/login', child: Text('Login')),
              PopupMenuItem(value: '/catalog', child: Text('Catálogo')),
              PopupMenuItem(
                  value: '/register', child: Text('Registro Vendedor')),
              PopupMenuItem(value: '/reviews', child: Text('Reseñas')),
              PopupMenuItem(
                  value: '/form', child: Text('Formulario de Soporte')),
              PopupMenuItem(value: '/upload', child: Text('Subir Productos')),
              PopupMenuItem(
                value: 'logout',
                child:
                    Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categorías
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryButton('Todo', true),
                  _buildCategoryButton('Comida', false),
                  _buildCategoryButton('Bebidas', false),
                  _buildCategoryButton('Snacks', false),
                ],
              ),
              const SizedBox(height: 10),
              // Grid de productos
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, bool isSelected) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () {},
      child: Text(title),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(product.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (product.tag != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      product.tag!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Ver Detalles'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String? tag;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    this.tag,
  });
}

List<Product> products = [
  Product(
      name: 'Hamburguesa Clásica',
      description: 'Con papas fritas',
      imagePath: 'assets/hamburguesa.jpg',
      price: 5.99,
      tag: 'Más Vendido'),
  Product(
      name: 'Smoothie Natural',
      description: 'Frutas frescas',
      imagePath: 'assets/smoothie.jpg',
      price: 3.50,
      tag: 'Nuevo'),
  Product(
      name: 'Pines Decorativos',
      description: 'Set de 3 unidades',
      imagePath: 'assets/pines.jpg',
      price: 4.99),
  Product(
      name: 'Pack de Snacks',
      description: 'Variedad de dulces',
      imagePath: 'assets/snacks.jpg',
      price: 2.99,
      tag: 'Oferta'),
];
