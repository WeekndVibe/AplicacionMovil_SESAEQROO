import 'package:appmonitor/Login/Splash_Screnn/splash_screnn.dart';
import 'package:flutter/material.dart';
import 'package:appmonitor/Seccion Publica/pantallaPrincipalSeccionPublica.dart';
import 'package:appmonitor/Seccion Privada/pantallaPrincipalSeccionPrivada.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}







class SingInScreen extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                // Imagen de fondo difuminada
                Image.asset(
                  'assets/fondo2.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.7),
                ),
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'SISTEMA LOCAL DE INFORMACIÓN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 245,
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65.0),
                        child: TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65.0),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 100),
                      ElevatedButton(
                        onPressed: () {
                          String username = userController.text;
                          String password = passwordController.text;
                          if(username == "usuario1" && password == "123456") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaPrincipalSeccionPublica()));
                          }else if (username == "usuario2" && password == "1234") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PantallaPrincipalSeccionPrivada()));
                          };
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
