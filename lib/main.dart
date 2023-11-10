import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_states.dart';
import 'package:weather/views/search_view.dart';

import 'views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit,WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              //locale: Locale('ar'),
              theme: ThemeData(
                  primarySwatch: getWeatherTheme(
                      condition: BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition)),
              initialRoute: 'home',
              routes: {
                'home': (context) => const HomeView(),
                'searchView': (context) => SearchView()
              },
              debugShowCheckedModeBanner: false,
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherTheme({required String? condition}) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.purple;
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return white;
    case 'Ice pellets':
      return Colors.cyan;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.indigo;
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.deepPurple;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.red;
    default:
      return Colors.blue; // Default color for unknown conditions.
  }
}

//Abdelmaboud !!
const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
