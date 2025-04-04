import 'package:flutter/material.dart';

class SupportFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soporte Técnico'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.menu, color: Colors.black),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.support_agent, size: 50, color: Colors.blue),
                  SizedBox(height: 8),
                  Text(
                    '¿Cómo podemos ayudarte?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Completa el formulario y te responderemos lo antes posible',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre Completo',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Tipo de Problema',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                    child: Text('Problema Técnico'), value: 'tecnico'),
                DropdownMenuItem(
                    child: Text('Facturación'), value: 'facturacion'),
                DropdownMenuItem(child: Text('Otro'), value: 'otro'),
              ],
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Descripción del Problema',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Aquí podrías abrir un picker de archivos en el futuro
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attachment, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('Adjunta capturas de pantalla (opcional)')
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí iría el envío de datos
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Enviar Solicitud', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
