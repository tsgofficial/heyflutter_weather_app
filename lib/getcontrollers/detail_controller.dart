import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:heyflutter_weather_app/models/place_detail_model.dart';
import 'package:heyflutter_weather_app/models/weather_model.dart';
import 'package:heyflutter_weather_app/repository/apis/api.dart';

class DetailController extends GetxController {
  final weatherResult = Rxn<WeatherModel>();
  final isLoadingGetWeather = false.obs;
  final placeResult = PlaceResultModel().obs;

  Future<WeatherModel?> getWeatherByLocation(
      double longitude, double latitude) async {
    final response = await Api().getWeather(longitude, latitude);

    if (response.cod == 200) {
      return weatherResult.value = response;
    } else {
      return null;
    }
  }

  Future<WeatherModel?> getWeatherByName({required String placeName}) async {
    isLoadingGetWeather.value = true;
    final location = await locationFromAddress(placeName);

    final response = await getWeatherByLocation(
      location.first.longitude,
      location.first.latitude,
    );

    if ((response ?? WeatherModel()).cod == 200) {
      isLoadingGetWeather.value = false;
      return weatherResult.value = response;
    } else {
      isLoadingGetWeather.value = false;
      return null;
    }
  }

  Future getPlaceImage(String placeId) async {
    final response = await Api().getPlaceImage(placeId);
    placeResult.value = response;
  }
}
