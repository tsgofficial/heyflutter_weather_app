import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_weather_app/getcontrollers/detail_controller.dart';
import 'package:heyflutter_weather_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final controller = Get.put(DetailController());
  await controller.getPlaceImage(
      '515de047b3a272c2bf59fecaefd95fbf4940f00101f9014b1d5c0000000000c002019203174c6f6e646f6e20566963746f7269612073746174696f6e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
