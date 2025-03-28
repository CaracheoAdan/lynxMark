import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lince_market/screens/product_filter_screen.dart';
import 'product_catalog_screen.dart'; // Asegúrate que la ruta sea correcta

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor llena todos los campos')),
      );
      return;
    }

    // Aquí iría tu lógica de autenticación

    // Navegar a la pantalla de catálogo
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProductFilterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 130),
                SizedBox(height: 20),
                Text(
                  "Lince Market",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004AAD),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Tu mercado universitario",
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),
                SizedBox(height: 60),
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
                      Text(
                        "Correo institucional",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _emailController,
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
                      Text(
                        "Contraseña",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon:
                              Icon(Icons.visibility, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF004AAD),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Acción para recuperar contraseña
                          },
                          child: Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF004AAD)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("O"),
                          ),
                          Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "¿No tienes una cuenta? ",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(
                                text: "Regístrate aquí",
                                style: TextStyle(
                                  color: Color(0xFF004AAD),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Acción de registro
                                  },
                              ),
                            ],
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
}
