import 'package:flutter/material.dart';
import 'package:weather/constants/assets.dart';
import 'package:weather/widgets/custom_text.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.assetsImagesSeasonchangeBro),
          const CustomText('There is no weather'),
          const CustomText('    Start searching now 🔍 !')
        ],
      ),
    );
  }
}
