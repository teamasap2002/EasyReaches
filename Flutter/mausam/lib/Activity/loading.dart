import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/Worker/worker.dart';
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Pune";
  late String temp;
  late String hum;
  late String air_speed;
  late String desc;
  late String main;
  late String icon;
  void startApp(String city) async{
    Worker instance = Worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "temp_value" : temp,
      "hum_value":hum,
      "air_speed_value":air_speed,
      "desc_value": desc,
      "main_value": main,
      "icon_value":icon,
      "city_value":city,
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if(search != null && search.isNotEmpty??false){
      city = search?['searchText']!;
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 230,),
              Image.asset("assets/images/mausam_logo.png", height: 240,width: 240,),
              Text(
                "Mausam App",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500, color: Colors.white),
              ),
              SizedBox(height: 10,),
              Text(
                "Made by SB",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white),
              ),
              SizedBox( height: 10,),
        
          SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),
            ],
          ),
        ),
      ),
    backgroundColor: Colors.blue[400],
    );
  }
}
