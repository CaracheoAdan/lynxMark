import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// Modelo simple de producto
class Producto {
  final String nombre;
  final String categoria;
  final String descripcion;
  final double precio;
  final bool disponible;
  final XFile imagen;

  Producto({
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.precio,
    required this.disponible,
    required this.imagen,
  });
}

class PublicarProductoScreen extends StatefulWidget {
  @override
  _PublicarProductoScreenState createState() => _PublicarProductoScreenState();
}

class _PublicarProductoScreenState extends State<PublicarProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _imagen;
  final ImagePicker _picker = ImagePicker();

  String? _nombre;
  String? _categoria;
  String? _descripcion;
  String? _precio;
  bool _disponible = true;

  void _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imagen = picked;
    });
  }

  void _publicarProducto() {
    if (_imagen == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor selecciona una imagen')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final producto = Producto(
        nombre: _nombre!,
        categoria: _categoria!,
        descripcion: _descripcion ?? '',
        precio: double.parse(_precio!),
        disponible: _disponible,
        imagen: _imagen!,
      );

      // Acá podrías enviar el producto a Firebase, backend, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Producto publicado: ${producto.nombre}')),
      );

      // Podés limpiar los campos si querés
      setState(() {
        _formKey.currentState!.reset();
        _imagen = null;
        _disponible = true;
        _categoria = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Publicar Producto', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: _imagen == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload, size: 40, color: Colors.grey[600]),
                            SizedBox(height: 8),
                            Text(
                              'Toca para subir o arrastrar tus imágenes',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(File(_imagen!.path),
                              fit: BoxFit.cover, width: double.infinity),
                        ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Nombre del Producto'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Ingrese el nombre del producto' : null,
                onSaved: (value) => _nombre = value,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: _inputDecoration('Categoría'),
                items: ['Comida', 'Electrónica', 'Ropa', 'Otros']
                    .map((c) => DropdownMenuItem(child: Text(c), value: c))
                    .toList(),
                value: _categoria,
                onChanged: (value) => setState(() => _categoria = value),
                validator: (value) => value == null ? 'Seleccione una categoría' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Descripción'),
                maxLines: 3,
                onSaved: (value) => _descripcion = value,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Precio').copyWith(prefixText: '\$ '),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese un precio';
                  final parsed = double.tryParse(value);
                  if (parsed == null || parsed < 0) return 'Ingrese un número válido';
                  return null;
                },
                onSaved: (value) => _precio = value,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Producto Disponible', style: TextStyle(fontSize: 16)),
                  Switch(
                    value: _disponible,
                    onChanged: (val) => setState(() => _disponible = val),
                    activeColor: Colors.blue,
                  ),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _publicarProducto,
                  child: Text('Publicar Producto',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[700]),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
