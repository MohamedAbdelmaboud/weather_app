import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_cubit.dart';
import 'package:weather/main.dart';
import 'package:weather/widgets/custom_text.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [getWeatherTheme(condition: weatherModel.condition).shade300,
              getWeatherTheme(condition: weatherModel.condition).shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CustomText(weatherModel.cityName),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: CustomText(weatherModel.country,fontSize: 14,),
              ),
              CustomText(
                'Last updated ${weatherModel.date.hour} : ${weatherModel.date.minute}',
                fontSize: 14,
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.imagePath!}'),
                CustomText("${weatherModel.avgTemp.round()}"),
                Column(
                  children: [
                    CustomText(
                      'max: ${weatherModel.maxTemp.round()}',
                      fontSize: 14,
                    ).pacifico(),
                    CustomText(
                      'min: ${weatherModel.minTemp.round()}',
                      fontSize: 14,
                    ).pacifico()
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomText(weatherModel.condition).pacifico(),
        ],
      ),
    );
  }
}
