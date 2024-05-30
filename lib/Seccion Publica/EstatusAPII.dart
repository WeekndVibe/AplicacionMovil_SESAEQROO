import 'package:appmonitor/Seccion%20Publica/Incidencias.dart';
import 'package:appmonitor/Seccion%20Publica/EstatusAPII.dart';
import 'package:flutter/material.dart';
import 'package:appmonitor/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class EstatusAPI extends StatelessWidget {
  const EstatusAPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Estatus Actual\n de la API',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 40),
              Icon(
                Icons.check_circle_outlined,
                color: Colors.green,
                size: 40,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: 350,
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: Text(
            "Estatus Semanal de la API",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              maximum: 100,
            ),
            legend: Legend(isVisible: false), // Ocultar leyenda
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries>[
              ColumnSeries<ChartData, String>(
                dataSource: getChartData(),
                xValueMapper: (ChartData data, _) => data.day,
                yValueMapper: (ChartData data, _) => data.status,
                name: 'Estatus',
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}


List<ChartData> getChartData() {
  return [
    ChartData('Lu', 66),
    ChartData('Ma', 100),
    ChartData('Mie', 100),
    ChartData('Jue', 100),
    ChartData('Vi', 33),
    ChartData('Sa', 100),
    ChartData('Do', 66),
  ];
}



class ChartData {
  ChartData(this.day, this.status);
  final String day;
  final double status;
}

class ListadoSistemas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF002345),
        title: Text(
          'Estatus de la API',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        alignment: Alignment.topCenter, // Mueve el contenido hacia la parte superior
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0), // Añade un padding superior
                child: Column(
                  children: [
                    _buildSystemItem(context, 'Sistema de Declaraciones', 'Sistema 1', Icons.check_circle_outlined, Colors.green, 'assets/sistema1.jpeg'),
                    _buildSystemItem(context, 'Sistema de Servidores Publicos\n en contrataciones', 'Sistema 2', Icons.cancel_outlined, Colors.redAccent, 'assets/sistema2.png'),
                    _buildSystemItem(context, 'Sistema de Sancionados', 'Sistema 3', Icons.check_circle_outlined, Colors.green, 'assets/sistema3.png'),
                    _buildSystemItem(context, 'Sistema de Fiscalización', 'Sistema 4', Icons.cancel_outlined, Colors.redAccent, 'assets/sistema4.png'),
                    _buildSystemItem(context, 'Sistema de Denuncias', 'Sistema 5', Icons.check_circle_outlined, Colors.green, 'assets/sistema5.png'),
                    _buildSystemItem(context, 'Sistema de Contrataciones', 'Sistema 6', Icons.check_circle_outlined, Colors.green, 'assets/sistema6.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSystemItem(BuildContext context, String title, String subtitle, IconData icon, Color color, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Ajustado para mejorar el diseño
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath), // Ruta de la imagen
          radius: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),
        ),
        onTap: () => _showEstatusDialog(context, title),
      ),
    );
  }

  void _showEstatusDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Container(
            padding: EdgeInsets.all(12.0),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                EstatusAPI(), // Reutiliza el widget EstatusAPI
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_circle_right_outlined,
                      color: Colors.redAccent,
                        size: 40,
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}