// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/cubits/get_weather_cubit/get_wether_cubit.dart';
import 'package:weather/widgets/custom_text.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       foregroundColor: Colors.white,
       // backgroundColor: const Color(0xff66add8),
        title: const CustomText('search a City !', color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (cityName) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                  context); // search on widget tree for GetWeatherCubit
              getWeatherCubit.getWether(cityName: cityName);
              controller.clear();
              Navigator.of(context).pop();
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
            ],
            keyboardType: TextInputType.name, //phone Yes -- pc NO
            controller: controller,
            decoration: InputDecoration(
              labelText: 'search',
              hintText: 'Enter city name',
              hintStyle: GoogleFonts.montserrat(),
              labelStyle: GoogleFonts.montserrat(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color:  Color(0xff66add8), width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
