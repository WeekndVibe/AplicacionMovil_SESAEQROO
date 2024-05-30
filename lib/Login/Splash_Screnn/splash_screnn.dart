import 'package:appmonitor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animate_do/animate_do.dart';




class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SingInScreen()));
      //Navigator.pushNamed(context, "/Login");
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    double altura_responsiva = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ZoomIn(
              child: Container(
                height: altura_responsiva/3,
                child: const Image(
                  image: AssetImage("assets/logotipo.png"),
                  width: 300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),

        ],
      ),
    );
  }
}

