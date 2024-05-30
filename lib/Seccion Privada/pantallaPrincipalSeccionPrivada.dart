import 'package:flutter/material.dart';
import 'package:appmonitor/main.dart';




class PantallaPrincipalSeccionPrivada extends StatefulWidget {
  const PantallaPrincipalSeccionPrivada({super.key});

  @override
  _PantallaPrincipalSeccionPublicaState createState() => _PantallaPrincipalSeccionPublicaState();
}

class _PantallaPrincipalSeccionPublicaState extends State<PantallaPrincipalSeccionPrivada> {
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
                    'Estatus de los Entes',
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
                          builder: (context) => PantallaPrincipalSeccionPrivada()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Entes Activos',
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
                          builder: (context) => PantallaPrincipalSeccionPrivada()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Información de las APIS',
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
                      MaterialPageRoute(builder: (context) => PantallaPrincipalSeccionPrivada()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Estatus de Interconexión\n con la PDN \n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  leading: Icon(
                    Icons.online_prediction_rounded,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantallaPrincipalSeccionPrivada())
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Visialización de Incidencias',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  leading: Icon(
                    Icons.checklist_rtl,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PantallaPrincipalSeccionPrivada())
                    );
                  },
                )


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

      body:  Container()
    );
  }
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





