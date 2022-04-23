import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/constantes.dart';
import 'package:lesson_09/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String correo = "";
  String contrasenia = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-1.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/clock.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: const Center(
                            child: Text("Inicio sesión", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(5, 5)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Ingrese su email",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                onChanged: (nuevoValor) {
                                  setState(() {
                                    correo = nuevoValor;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Ingrese su contraseña",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                                onChanged: (nuevoValor) {
                                  setState(() {
                                    contrasenia = nuevoValor;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: const Center(
                            child: Text("INICIAR SESIÓN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ),
                        ),
                        onTap: () {
                          //Navigator.pushReplacementNamed(context, RoutePaths.homePage);
                          validarUsuario();
                        },
                        splashColor: Colors.deepPurpleAccent,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿No tienes una cuenta?", style: TextStyle(color: Colors.black54),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            child: const Text("Regístrate", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), fontWeight: FontWeight.bold),),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, RoutePaths.registerPage);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  void validarUsuario() {
    if(correo.isNotEmpty && contrasenia.isNotEmpty) {
      if(contrasenia.length >= 6) {
        loginUsuario();
      } else {
        mostrarMensaje(context, "La contraseña debe tener al menos 6 caracteres.", Constantes.MENSAJE_ERROR);
      }
    } else {
      mostrarMensaje(context, "Existen campos vacíos", Constantes.MENSAJE_ERROR);
    }
  }

  Future<void> loginUsuario() async {
    try {
      showBarraProgreso(context, "Iniciando sesión");
      final loginUser = await _auth.signInWithEmailAndPassword(email: correo, password: contrasenia);
      Navigator.of(context).pop();
      if(loginUser != null) {
        mostrarMensaje(context, "Bienvenido.", Constantes.MENSAJE_EXITOSO);
        Navigator.pushReplacementNamed(context, RoutePaths.homePage);
      }
    } on FirebaseAuthException catch(err) {
      mostrarMensaje(context, "Error: ${err.code}", Constantes.MENSAJE_ERROR);
      Navigator.of(context).pop();
    }
  }
}
