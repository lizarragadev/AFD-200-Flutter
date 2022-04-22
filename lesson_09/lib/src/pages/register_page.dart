import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String correo = "";
  String contrasenia = "";
  final MENSAJE_ERROR = 1;
  final MENSAJE_EXITOSO = 2;

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
                          image: AssetImage('images/background2.png'),
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
                                  image: AssetImage('images/clock.png')
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
                                  image: AssetImage('images/light-1.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: const Center(
                            child: Text("Registro", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
                                    Color.fromRGBO(143, 201, 251, 1.0),
                                    Color.fromRGBO(32, 97, 149, 0.6),
                                  ]
                              )
                          ),
                          child: const Center(
                            child: Text("REGISTRARSE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ),
                        ),
                        onTap: () {
                          //Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
                          validarUsuario();
                        },
                        splashColor: Colors.blue,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿Ya tienes una cuenta?", style: TextStyle(color: Colors.black54),),
                          const SizedBox(width: 10,),
                          GestureDetector(
                            child: const Text("Inicia Sesión", style: TextStyle(color: Color.fromRGBO(32, 97, 149, 0.6), fontWeight: FontWeight.bold),),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
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
        registrarUsuario();
      } else {
        mostrarMensaje(context, "La contraseña debe tener al menos 6 caracteres.", MENSAJE_ERROR);
      }
    } else {
      mostrarMensaje(context, "Existen campos vacíos", MENSAJE_ERROR);
    }
  }

  Future<void> registrarUsuario() async {
    try {
      showBarraProgreso(context, "Registrando");
      final newUser = await _auth.createUserWithEmailAndPassword(email: correo, password: contrasenia);
      Navigator.of(context).pop();
      if(newUser != null) {
        mostrarMensaje(context, "Registro exitoso", MENSAJE_EXITOSO);
        Navigator.pushReplacementNamed(context, RoutePaths.loginPage);
      }
    } on FirebaseAuthException catch(err) {
      mostrarMensaje(context, "Error: ${err.code}", MENSAJE_ERROR);
      Navigator.of(context).pop();
    }
  }
}












