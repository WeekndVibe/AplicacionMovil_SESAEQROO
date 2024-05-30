import 'dart:ui';
import 'package:flutter/material.dart';



class InformacionEnte extends StatelessWidget {
  const InformacionEnte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002345),
        title: Text(
          'Información del Ente Público',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40), // Espacio adicional arriba de la tarjeta
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DataTable(
                        columnSpacing: 20,
                        horizontalMargin: 10,
                        headingRowHeight: 0,
                        dataRowHeight: 90, // Altura de cada fila
                        columns: [
                          DataColumn(label: Container()),
                          DataColumn(label: Container()),
                        ],
                        rows: [
                          buildDataRow('Nombre del Ente:', 'Secretaria Ejecutiva del Sistema Anticorrupción del estado de Quintana Roo'),
                          buildDataRow('Siglas:', 'SESAEQROO'),
                          buildDataRow('Certificado:', 'Https'),
                          buildDataRow('URL:', 'https://sesaeqroo.gob.mx:8484/apiResources/v2/declaracionesV2'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir las filas de la tabla
  DataRow buildDataRow(String attribute, String value) {
    return DataRow(
      cells: [
        DataCell(
          Container(
            padding: EdgeInsets.symmetric(vertical: 12), // Ajusta el padding vertical
            child: Text(
              attribute,
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        DataCell(
          Container(
            width: 200, // Ajustar el ancho del contenedor si es necesario
            padding: EdgeInsets.symmetric(vertical: 16), // Ajusta el padding vertical
            child: Text(
              value,
              style: TextStyle(fontSize: 18, color: Colors.black),
              overflow: TextOverflow.visible, // Asegura que el texto se visualice completamente
            ),
          ),
        ),
      ],
    );
  }
}


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InformacionEnte(),
  ));
}
