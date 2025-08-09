import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String location = "North America";
  String maxTemp = "24°";
  String minTemp = "18°";
  String healthRisk = "3-Low Health Risk";

  List<Map<String, dynamic>> forecastData = [
    {"day": "Mon", "temp": "19°C", "icon": Icons.cloud},
    {"day": "Tue", "temp": "18°C", "icon": Icons.cloud_queue},
    {"day": "Wed", "temp": "18°C", "icon": Icons.cloud_queue},
    {"day": "Thu", "temp": "19°C", "icon": Icons.cloud},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E2C64), Color(0xFF9D3FE1)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    "Max: $maxTemp  Min: $minTemp",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '7-Days Forecasts',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: forecastData.length,
                      itemBuilder: (context, index) {
                        return forecastCard(
                          forecastData[index]['day'],
                          forecastData[index]['temp'],
                          forecastData[index]['icon'],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9D3FE1), Color(0xFF4A4FE1)],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          healthRisk,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      infoCard('SUNRISE', '5:28 AM\nSunset: 7:25 PM', Icons.wb_sunny),
                      infoCard('UV INDEX', '4\nModerate', Icons.wb_iridescent),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        location = "Europe";
                        maxTemp = "20°";
                        minTemp = "12°";
                        healthRisk = "2-Moderate Health Risk";
                        forecastData = [
                          {"day": "Mon", "temp": "15°C", "icon": Icons.cloud},
                          {"day": "Tue", "temp": "14°C", "icon": Icons.cloud_queue},
                          {"day": "Wed", "temp": "16°C", "icon": Icons.cloud},
                          {"day": "Thu", "temp": "18°C", "icon": Icons.wb_sunny},
                        ];
                      });
                    },
                    child: const Text("Update Data"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget forecastCard(String day, String temp, IconData icon) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(temp, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  static Widget infoCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
