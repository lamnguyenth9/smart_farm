import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_farm/bloc/weather_bloc_dart_bloc.dart';
import 'package:smart_farm/node1.dart';
import 'package:smart_farm/presentation/cubit/cubit/sensor_cubit.dart';
import 'package:smart_farm/weather_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCzd2fiHPcXUPLRQZd_oWg52L3SeXDmJnw",
          authDomain: "lora-smartfarming.firebaseapp.com",
          databaseURL: "https://lora-smartfarming-default-rtdb.firebaseio.com",
          projectId: "lora-smartfarming",
          storageBucket: "lora-smartfarming.appspot.com",
          messagingSenderId: "379595541381",
          appId: "1:379595541381:web:7db518b1c0f1edecf312ec",
          measurementId: "G-Z66BN2VQD9"));
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<WeatherBlocDartBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SensorCubit>(),
        ),
      ],
      child: MaterialApp(
          home: Scaffold(
        body: Row(
          children: [
            FutureBuilder(
              future: _determinePosition(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BlocProvider<WeatherBlocDartBloc>(
                    create: (context) => WeatherBlocDartBloc()
                      ..add(FetchWeather(snapshot.data as Position)),
                    child: WeatherScreen(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Node1()
          ],
        ),
      )),
    );
  }
}

/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}
