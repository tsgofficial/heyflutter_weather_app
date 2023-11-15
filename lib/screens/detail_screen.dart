import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_weather_app/getcontrollers/detail_controller.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  final String place;
  const DetailScreen({super.key, required this.place});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = Get.put(DetailController());
  @override
  void initState() {
    super.initState();
    controller.getWeatherByName(placeName: widget.place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoadingGetWeather.value
            ? Center(
                child: LottieBuilder.asset('assets/lotties/loading.json'),
              )
            : Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/london.jpeg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.location_on_rounded),
                                  Text('London, UK'),
                                ],
                              ),
                              Icon(Icons.menu),
                            ],
                          ),
                        ),
                        Text(
                          DateFormat('MMMM d').format(DateTime.now()),
                        ),
                        Text(
                          'Updated ${"${DateFormat('M/d/yyyy').format(DateTime.now())} ${DateFormat('jm').format(DateTime.now())}"}',
                        ),
                        const Text(
                          'Mostly Cloudy',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
