import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_states.dart';
import 'package:weather/widgets/custom_text.dart';
import 'package:weather/widgets/no_weather_body.dart';
import 'package:weather/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                //backgroundColor:  Color(0xff66add8).withOpacity(0.8),
        appBar: AppBar(
          title: const CustomText(
            'Weather',
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'searchView');
                },
                icon: const Icon(Icons.search),color: Colors.white,)
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is WeatherLoadedState) {
              return  WeatherInfoBody();
            } else if (state is FaliureState) {
              return CustomText(state.massage);
            } else {
              return const NoWeatherBody();
            }
          },
        ) //intial state
        );
  }
}
