import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heyflutter_weather_app/getcontrollers/home_controller.dart';
import 'package:heyflutter_weather_app/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search for places',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                onChanged: (value) {
                  controller.getAutoComplete(value);
                },
              ),
            ),
            Obx(
              () => controller.autoCompleteList.isEmpty
                  ? const Center(
                      child: Text('No result found!'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.autoCompleteList.length,
                      itemBuilder: (context, index) {
                        final result = controller.autoCompleteList[index];
                        return ListTile(
                          leading: const Icon(Icons.place_outlined),
                          title: Text(
                            result.addressLine1 ?? (result.addressLine2 ?? ''),
                          ),
                          subtitle: Text(
                            result.formatted ?? '',
                          ),
                          onTap: () {
                            Get.to(
                              () => DetailScreen(
                                place: result.name ?? (result.formatted ?? ''),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
