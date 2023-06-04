import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:whtear_api/post_aip/provider/post_provider.dart';
import 'package:whtear_api/post_aip/view/home_screen1.dart';
import 'package:whtear_api/provider/weather_provider.dart';
import 'package:whtear_api/view/weather_screen.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => WeatherProvider()),
          ChangeNotifierProvider(create: (context) => PostProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => HomeScreen(),
            // '/':(context) => PostScreen()
          },
        ),
      );
    },)
  );
}