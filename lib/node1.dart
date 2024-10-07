import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_farm/presentation/cubit/cubit/sensor_cubit.dart';
import 'injection_container.dart'as di;



class Node1 extends StatefulWidget {
  const Node1({super.key});

  @override
  State<Node1> createState() => _Node1State();
}

class _Node1State extends State<Node1> {
  late final stream = FirebaseDatabase.instance.ref('test/').onValue;
  @override
  void initState() {
    BlocProvider.of<SensorCubit>(context).fetchSensorData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SensorCubit, SensorState>(
      builder: (context, state) {
        if(state is SensorFailure){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is SensorLoaded){
          final data=state.dataEnttity;
          
          return Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 400,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text(
                "FARMING DASHBOARD",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[400]),
                        child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/7.png",
                                        scale: 6,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "SOIL MOISTURE",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' ${data.soilmoisturepercent}%',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/8.png",
                                        scale: 6,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "SOIL TEMP",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' ${data.soiltemp}℃',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/9.png",
                                        scale: 6,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "HUMIDITY",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' ${data.humidity}%',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/10.png",
                                        scale: 6,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "TEMPERATURE",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ' ${data.temperature}℃',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[400]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "NODE 2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            CircularProgressIndicator()
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 250,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[400]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "NODE 3",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              CircularProgressIndicator()
                            ],
                          )),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[400]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "NODE 4",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            CircularProgressIndicator()
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
        }
        return Container(
          child: Text("1"),
        );
      },
    );
  }
}
