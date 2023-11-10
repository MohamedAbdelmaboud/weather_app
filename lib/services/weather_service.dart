import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio(); //dio object
  String baseUrl = 'http://api.weatherapi.com/v1/';
  String apiKey = '4d993b6470e94a1496e184837231010';
  String endPoint = 'forecast.json';
  Future<WeatherModel> getWether({required String cityName}) async {
    try {
      final Response response = await dio.get(baseUrl + endPoint,
          queryParameters: {'key': apiKey, 'days': 1, 'q': cityName});
      dynamic json = response.data; // Data--> which data i need
      return WeatherModel.fromJson(json);
    } on DioException catch (e) {
      final String errorMassage =
          e.response?.data['error']['message'] ?? 'oops! something went wrong ';
      //! -->sure 100% can't be null
      //? --> response is null don't access .data['error']['message']
      throw Exception(errorMassage);
    } catch (e) {
      throw Exception('oops! something went wrong ,Try later');
    }
  }
}
