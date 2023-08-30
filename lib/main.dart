import 'package:flutter/material.dart';
import 'package:flutter_loyiha/controlle/api.dart';
import 'package:flutter_loyiha/model/weather.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("WeatherApp"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getWeather(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Center(
                child: Text("Ma'lumot yo'q"),
              ),
              // CircularProgressIndicator(),
            );
          }
          List<Weather> weather = snapshot.data!;
          return ListView.builder(
            itemCount: weather.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.indigo.shade200,
                child: ListTile(
                  title: Text(
                    weather[index].locationName,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Arial",
                    ),
                  ),
                  subtitle: Text(
                    weather[index].country,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Arial",
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
