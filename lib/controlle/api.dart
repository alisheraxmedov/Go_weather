import 'dart:async';
import 'dart:convert';
import 'package:flutter_loyiha/model/weather.dart';
import 'package:http/http.dart' as http;

Future<List<Weather>> getWeather([String location = "Samarkand", int day = 1]) async {
  final response = await http.get(Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=4c86cc5911e74b6abe9102831230203&q=$location&days=$day"));

  try {

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> mapToList = [];
      mapToList.add(jsonDecode(response.body));
      List<Weather> newWeather = [];
      Map<String, dynamic> body = {"result": mapToList};
      print(body.runtimeType);

      for (int i = 0; i < body['result'].length; i++) {
        newWeather.add(
          Weather.fromJson(body['result'][i]),
        );
      }
      return newWeather;
    } 

    else {
      throw Exception("StatusCode = ${response.statusCode}");
    }

  } 
  
  catch (e) {
    throw Exception("Eror: $e");
  }
}
