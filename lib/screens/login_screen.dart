import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                // Logo
                Image.asset('assets/logo.png', height: 130),

                SizedBox(height: 20),

                // Nombre de la app
                Text(
                  "Lince Market",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004AAD),
                  ),
                ),

                SizedBox(height: 7),

                // Eslogan
                Text(
                  "Tu mercado universitario",
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),

                SizedBox(height: 60),

                // Formulario de login
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
                      // Texto "Correo institucional"
                      Text(
                        "Correo institucional",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),

                      // Campo Correo Institucional
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        readOnly: false,
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

                      // Texto "Contraseña"
                      Text(
                        "Contraseña",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),

                      // Campo Contraseña
                      TextField(
                        obscureText: true,
                        readOnly: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.grey), // Ícono de bloqueo
                          suffixIcon: Icon(Icons.visibility, color: Colors.grey), // Ícono de visibilidad
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Botón de Iniciar Sesión
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Acción del login
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF004AAD), // Azul universitario
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

                      // Enlace "Olvidaste tu contraseña"
                      Center(
                        child: TextButton(
                          onPressed: () {
                            // Acción para recuperar contraseña
                          },
                          child: Text(
                            "¿Olvidaste tu contraseña?",
                            style: TextStyle(fontSize: 16, color: Color(0xFF004AAD)),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Divider
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

                      // Enlace "Registrarse aquí" dentro del cuadro
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