import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_farm/bloc/weather_bloc_dart_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocDartBloc, WeatherBlocDartState>(
      builder: (context, state) {
        if (state is WeatherBlocDartSuccesss){
         return Container(
          color: Color.fromARGB(255, 41, 53, 91),
          height: MediaQuery.of(context).size.height,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  
                  "${state.weather.areaName}",
                  style: TextStyle(
                    fontSize: 25,
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 100,),
                Text("THỜI TIẾT HÔM NAY", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                Text(
                  "${state.weather.temperature!.celsius!.round()}℃ ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  state.weather.weatherMain!.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  DateFormat().format(state.weather.date!),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/16.png",
                          scale: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wind",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${state.weather.windSpeed}km/h",
                              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/17.png",
                          scale: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "humidity",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${state.weather.humidity}%",
                              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/3.png",
                          scale: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Temp max",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${state.weather.tempMax!.celsius!.round()} ℃",
                              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/4.png",
                          scale: 5,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Temp min",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${state.weather.tempMin!.celsius!.round()}℃",
                              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
        }else{
          return Center( 
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
