import 'package:flutter/material.dart';

class ProductFilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrar Productos"),
        backgroundColor: Color(0xFF004AAD),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              } else {
                Navigator.pushNamed(context, value);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: '/analysis', child: Text('Análisis')),
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
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filtros
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Filtros",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    Text("Precio Máximo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        prefixText: "\$ ",
                        hintText: "100",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Categoría",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      value: "Todas las categorías",
                      items: [
                        "Todas las categorías",
                        "Comida",
                        "Bebidas",
                        "Accesorios"
                      ]
                          .map((item) =>
                              DropdownMenuItem(child: Text(item), value: item))
                          .toList(),
                      onChanged: (_) {},
                    ),
                    SizedBox(height: 15),
                    Text("Ordenar por",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      value: "Más Vendidos",
                      items: [
                        "Más Vendidos",
                        "Precio (menor a mayor)",
                        "Precio (mayor a menor)",
                        "Mejor Valorados"
                      ]
                          .map((item) =>
                              DropdownMenuItem(child: Text(item), value: item))
                          .toList(),
                      onChanged: (_) {},
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF004AAD),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          "Aplicar Filtros",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Productos Disponibles",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildProductCard("Sándwich Vegetal", "\$5.99", "4.5",
                      "assets/sandwich.jpg"),
                  _buildProductCard("Smoothie Natural", "\$4.50", "4.8",
                      "assets/smoothie.jpg"),
                  _buildProductCard(
                      "Cookies", "\$3.00", "4.2", "assets/cookies.jpg"),
                  _buildProductCard(
                      "Pines Decorativos", "\$2.50", "4.6", "assets/pines.jpg"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
        selectedItemColor: Color(0xFF004AAD),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildProductCard(
      String name, String price, String rating, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
                Text(price,
                    style: TextStyle(
                        color: Color(0xFF004AAD), fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
