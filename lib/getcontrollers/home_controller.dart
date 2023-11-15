import 'package:get/get.dart';
import 'package:heyflutter_weather_app/models/autocompletion_model.dart';
import 'package:heyflutter_weather_app/repository/apis/api.dart';

class HomeController extends GetxController {
  final RxList<Result> autoCompleteList = <Result>[].obs;

  getAutoComplete(String place) async {
    final result = await Api().getPlaceAutoCompletion(place);
    autoCompleteList.value = result.results!;
  }
}
