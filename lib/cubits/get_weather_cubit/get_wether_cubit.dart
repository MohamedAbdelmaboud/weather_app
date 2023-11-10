import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherIntialState());
  WeatherModel? weatherModel;
  getWether({required cityName}) async {
    try {
      weatherModel = await WeatherService().getWether(cityName: cityName);
      emit(WeatherLoadedState());
    } on Exception catch (e) {
      final String massage = e.toString();
      emit(FaliureState(massage: massage));
    }
  }
}
