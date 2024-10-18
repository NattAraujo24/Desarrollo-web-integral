import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_b/kernel/widgets/custom_text_field_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesión"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 200, height: 200),
                TextFormField(
                  controller: _emailController,
                  validator: validateEmail,
                  decoration: const InputDecoration(
                    hintText: "Correo electronico",
                    label: Text("Correo electronico"),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextFieldPassword(
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Verificar que el formulario es válido
                      if (_formKey.currentState!.validate()) {
                        try {
                          // Intentar el inicio de sesión
                          UserCredential credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          // Redirigir al usuario si el inicio de sesión fue exitoso
                          if (credential.user != null) {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        } on FirebaseAuthException catch (e) {
                          String errorMessage = '';
                          if (e.code == 'user-not-found') {
                            errorMessage = 'No se encontró un usuario con ese correo.';
                          } else if (e.code == 'wrong-password') {
                            errorMessage = 'Contraseña incorrecta.';
                          } else {
                            errorMessage = 'Error: ${e.message}';
                          }

                          // Mostrar el mensaje de error al usuario
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)),
                          );
                        }
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Iniciar Sesión"),
                  ),
                ),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: const Text("¿No tienes cuenta? Regístrate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
