import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_weather_app/getcontrollers/detail_controller.dart';
import 'package:heyflutter_weather_app/screens/home_screen.dart';
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

  Widget getAirAttributes({
    required String image,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 30,
          width: 30,
          color: Colors.white,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget getDayWeather({
    required DateTime date,
    required String desc,
    required String temp,
    required String lowSpeed,
    required String topSpeed,
  }) {
    return Column(
      children: [
        Text(
          DateFormat('E d').format(date),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        LottieBuilder.asset(
          'assets/lotties/sunny_rain.json',
          height: 50,
          width: 50,
        ),
        const SizedBox(height: 5),
        Text(
          '$temp°',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$lowSpeed-$topSpeed',
          style: const TextStyle(
            height: 0.5,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const Text(
          'km/h',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
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
                    child: SizedBox(
                      height: Get.size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'London, UK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    Get.to(() => HomeScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                DateFormat('MMMM d').format(DateTime.now()),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                ),
                              ),
                              Text(
                                'Updated ${"${DateFormat('M/d/yyyy').format(DateTime.now())} ${DateFormat('jm').format(DateTime.now())}"}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          LottieBuilder.asset(
                            'assets/lotties/sunny_rain.json',
                            height: 100,
                            width: 100,
                          ),
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Clear',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Text(
                                    '24',
                                    style: TextStyle(
                                      height: 0.75,
                                      fontSize: 100,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '°C',
                                      style: TextStyle(
                                        height: 1,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getAirAttributes(
                                  image: 'assets/images/drop-of-liquid.png',
                                  title: 'Humidity',
                                  value: '20%',
                                ),
                                getAirAttributes(
                                  image: 'assets/images/wind.png',
                                  title: 'Wind',
                                  value: '20km/h',
                                ),
                                getAirAttributes(
                                  image: 'assets/images/temperature.png',
                                  title: 'Feels like',
                                  value: '20°',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    getDayWeather(
                                      date: DateTime.now(),
                                      desc: 'rainy',
                                      temp: '20',
                                      lowSpeed: '1',
                                      topSpeed: '5',
                                    ),
                                    getDayWeather(
                                      date: DateTime.now(),
                                      desc: 'rainy',
                                      temp: '20',
                                      lowSpeed: '1',
                                      topSpeed: '5',
                                    ),
                                    getDayWeather(
                                      date: DateTime.now(),
                                      desc: 'rainy',
                                      temp: '20',
                                      lowSpeed: '1',
                                      topSpeed: '5',
                                    ),
                                    getDayWeather(
                                      date: DateTime.now(),
                                      desc: 'rainy',
                                      temp: '20',
                                      lowSpeed: '1',
                                      topSpeed: '5',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
