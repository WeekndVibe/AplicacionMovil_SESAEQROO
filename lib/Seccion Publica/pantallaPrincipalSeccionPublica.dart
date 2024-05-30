import 'package:appmonitor/Seccion%20Publica/Incidencias.dart';
import 'package:appmonitor/Seccion Publica/InformacionEnte.dart';
import 'package:appmonitor/Seccion%20Publica/EstatusAPII.dart';
import 'package:flutter/material.dart';
import 'package:appmonitor/main.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';




class PantallaPrincipalSeccionPublica extends StatefulWidget {
  const PantallaPrincipalSeccionPublica({super.key});

  @override
  _PantallaPrincipalSeccionPublicaState createState() => _PantallaPrincipalSeccionPublicaState();
}

class _PantallaPrincipalSeccionPublicaState extends State<PantallaPrincipalSeccionPublica> {
  //List<Item> _data = generateItems(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'SESAEQROO',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0), // Altura del Divider
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Ajusta el valor para modificar la longitud del Divider
            child: Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Encabezado(),
                Container(
                  width: 300,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Informacion del Ente Publico',
                    style: TextStyle(
                      fontFamily: 'Teko',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(Icons.info_outline, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformacionEnte()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Estatus de la API',
                    style: TextStyle(
                      fontFamily: 'Teko',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(Icons.fact_check_outlined, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListadoSistemas()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Listado de Incidencias',
                    style: TextStyle(
                      fontFamily: 'Teko',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Icon(
                      Icons.pending_actions_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Incidencias()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: Text(
                'Cerrar Sesión',
                style: TextStyle(
                  fontFamily: 'Teko',
                  fontSize: 18,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(Icons.account_circle_outlined, color: Colors.black),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SingInScreen()),
                );
              },
            ),
          ],
        ),
      ),






    body: Container(
    alignment: Alignment.center, // Centra el contenido verticalmente
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    'Estatus de Interconexión con la \n Plataforma Digital Nacional\n                    (PDN)',
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 28),
    GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(), // Desactiva el desplazamiento del GridView
    children: [
    _buildSystemCard('assets/sistema1.jpeg', 'Sistema 1'),
    _buildSystemCard('assets/sistema2.png', 'Sistema 2'),
    _buildSystemCard('assets/sistema3.png', 'Sistema 3'),
    _buildSystemCard('assets/sistema4.png', 'Sistema 4'),
    _buildSystemCard('assets/sistema5.png', 'Sistema 5'),
    _buildSystemCard('assets/sistema6.png', 'Sistema 6'),
    ],
    ),
    ],
    ),
    ),
    ),
    );
  }
  }



Widget _buildSystemCard(String imagePath, String title) {
  return Container(
    margin: EdgeInsets.all(10), // Espacio entre los recuadros
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(3, 3), // Posición de la sombra
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 135,
          width: 175,
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}



class Encabezado extends StatelessWidget {
  const Encabezado({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Center(),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        image: DecorationImage(
          image: AssetImage('assets/logotipo.png'),
          fit: BoxFit.contain,

        ),
      ),
    );
  }
}







/*
class appBar extends StatelessWidget {
  const appBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
         Color(0xFF002366),
         Color(0xFF002390),
      ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
      )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("SESAEQROO ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),)
            ],
          )
        ],
      ),
    );
  }
}
*/




