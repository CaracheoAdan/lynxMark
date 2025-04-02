import 'package:flutter/material.dart';

class RegisterSellerScreen extends StatefulWidget {
  @override
  _RegisterSellerScreenState createState() => _RegisterSellerScreenState();
}

class _RegisterSellerScreenState extends State<RegisterSellerScreen> {
  bool isComidaSelected = false;
  bool isMaquillajeSelected = false;
  bool isDulcesSelected = false;
  bool isOtrosSelected = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro de Vendedor"),
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
      backgroundColor: Color.fromARGB(255, 204, 230, 215), // Fondo Verde Suave
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contenedor con el formulario
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título
                      Center(
                        child: Text(
                          "Registro de Vendedor",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Subtítulo
                      Center(
                        child: Text(
                          "Crea tu cuenta para empezar a vender",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),

                      SizedBox(height: 30),

                      // Campo Nombre Completo
                      Text("Nombre completo"),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          hintText: "Ingresa tu nombre completo",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      // Campo Correo Electrónico
                      Text("Correo electrónico"),
                      SizedBox(height: 5),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                          hintText: "No.Control@itcelaya.edu.mx",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      // Campo Contraseña
                      Text("Contraseña"),
                      SizedBox(height: 5),
                      TextField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          hintText: "Crea una contraseña",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Categorías de productos
                      Text("Categorías de productos"),
                      SizedBox(height: 10),

                      // Estilizado de categorías en cajas
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCategoryOption(
                                    "Comida",
                                    isComidaSelected,
                                    (value) => setState(
                                        () => isComidaSelected = value)),
                                _buildCategoryOption(
                                    "Maquillaje",
                                    isMaquillajeSelected,
                                    (value) => setState(
                                        () => isMaquillajeSelected = value)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildCategoryOption(
                                    "Dulces",
                                    isDulcesSelected,
                                    (value) => setState(
                                        () => isDulcesSelected = value)),
                                _buildCategoryOption(
                                    "Otros",
                                    isOtrosSelected,
                                    (value) => setState(
                                        () => isOtrosSelected = value)),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Botón Registrarse
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Acción para registrar vendedor
                          },
                          icon: Icon(Icons.person_add,
                              size: 20, color: Colors.white),
                          label: Text(
                            "Registrarse como vendedor",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF004AAD),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para los checkboxes de categorías en cajas
  Widget _buildCategoryOption(
      String title, bool value, Function(bool) onChanged) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            onChanged(!value);
          });
        },
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: value ? Color(0xFF004AAD) : Colors.grey,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: value,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                },
                activeColor: Color(0xFF004AAD),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
