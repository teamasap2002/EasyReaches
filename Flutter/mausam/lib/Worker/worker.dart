import 'dart:convert';

import 'package:http/http.dart';

class Worker{

  late String location;

  Worker({required this.location}){
    location = location;
  }
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;
  Future <void> getData() async{
    try{
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4260cdcec4f4db3fc6e4ce97f578143b"));
      Map data = jsonDecode(response.body);

      //Getting temp, humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //Getting AirSpeed

      Map wind = data['wind'];
      double getAir_speed = wind["speed"]*3.6;

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_desc = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //Assigning values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_desc;
      icon = weather_main_data['icon'].toString();
    }
    catch(e){
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find data";
      main = "NA";
      icon = "09d";
    }
  }
}