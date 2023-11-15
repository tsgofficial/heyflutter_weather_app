import 'package:get/get_connect.dart';
import 'package:heyflutter_weather_app/models/autocompletion_model.dart';
import 'package:heyflutter_weather_app/models/weather_model.dart';
import 'package:heyflutter_weather_app/repository/const.dart';

class Api extends GetConnect {
  Future<WeatherModel> getWeather(double longitude, double latitude) async {
    final response = await get(
        "https://api.openweathermap.org/data/2.5/weather?lat=$longitude&lon=$latitude&appid=8805381ba4500a4c2d1338f1aff1cf60&units=metric");
    if (response.statusCode == 200) {
      return weatherModelFromJson(response.bodyString.toString());
    } else {
      return WeatherModel();
    }
  }

  Future<AutoCompletionModel> getPlaceAutoCompletion(String place) async {
    final response = await get(
        "https://api.geoapify.com/v1/geocode/autocomplete?text=$place&format=json&apiKey=$geoapifyKey");
    return autoCompletionModelFromJson(response.bodyString.toString());
  }

  Future getPlaceImage(String placeId) async {
    const dataId = "0x47d8a00baf21de75:0x52963a5addd52a99";
    const string =
        'https://serpapi.com/search.json?api_key=$serpApiKey&engine=google_maps_photos&data_id=$dataId';
    final response = await get(string);
    // 'https://serpapi.com/search.json?api_key=$serpApiKey&engine=google_maps_photos&data_id=$placeId');

    print(string);
  }
}
