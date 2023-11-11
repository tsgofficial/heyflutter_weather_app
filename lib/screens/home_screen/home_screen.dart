import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}
