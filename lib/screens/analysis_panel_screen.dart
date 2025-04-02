import 'package:flutter/material.dart';

class AnalysisPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel de Análisis"),
        backgroundColor: Color(0xFF004AAD),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado del usuario y notificaciones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bienvenido",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.black54),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/user.jpg"),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Tarjetas de estadísticas
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    _buildStatCard(
                      "Satisfacción",
                      "85%",
                      "+2.5% vs mes anterior",
                      Colors.green,
                      Icons.show_chart,
                      Colors.green,
                    ),
                    SizedBox(width: 12),
                    _buildStatCard(
                      "Comentarios",
                      "324",
                      "Últimos 30 días",
                      Colors.blue,
                      Icons.forum,
                      Colors.blue,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Buscador
              TextField(
                decoration: InputDecoration(
                  hintText: "Buscar productos...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Filtros por tiempo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeFilter("Todo", true),
                  _buildTimeFilter("Esta semana", false),
                  _buildTimeFilter("Este mes", false),
                ],
              ),

              SizedBox(height: 25),

              Text(
                "Comentarios Recientes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              SizedBox(height: 12),

              _buildCommentCard(
                name: "Ana García",
                rating: 4,
                feedback:
                    "Excelente servicio y productos de calidad. La entrega fue rápida.",
                tags: ["calidad", "rápido"],
                image: "assets/user1.jpg",
                status: "Positivo",
                statusColor: Colors.green,
              ),

              SizedBox(height: 10),

              _buildCommentCard(
                name: "Carlos Ruiz",
                rating: 2,
                feedback: "El producto llegó tarde y frío. No lo recomiendo.",
                tags: ["demora", "temperatura"],
                image: "assets/user2.jpg",
                status: "Negativo",
                statusColor: Colors.red,
              ),
            ],
          ),
        ),
      ),

      // Menú inferior
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        selectedItemColor: Color(0xFF004AAD),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  // Tarjeta estadística
  Widget _buildStatCard(String title, String value, String subtitle,
      Color color, IconData icon, Color iconColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenido textual
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text(
                    value,
                    style: TextStyle(
                      color: color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(icon, color: iconColor),
          ],
        ),
      ),
    );
  }

  // Filtros de tiempo
  Widget _buildTimeFilter(String label, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Color(0xFF004AAD) : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Tarjeta de comentario
  Widget _buildCommentCard({
    required String name,
    required int rating,
    required String feedback,
    required List<String> tags,
    required String image,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 18,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(name,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          // Rating
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 18,
              );
            }),
          ),

          SizedBox(height: 6),

          // Comentario
          Text(feedback),

          SizedBox(height: 8),

          // Etiquetas
          Wrap(
            spacing: 6,
            children: tags.map((tag) {
              return Chip(
                label: Text(tag),
                backgroundColor: Colors.blue[50],
                labelStyle: TextStyle(color: Colors.blue),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
