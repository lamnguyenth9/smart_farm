import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_farm/domain/entities/data_enttity.dart';
import 'package:smart_farm/domain/usecases/get_data_usecase.dart';

part 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final GetDataUsecase getDataUsecase;
  SensorCubit({required this.getDataUsecase}) : super(SensorInitial());
  Future<void> fetchSensorData() async {
    try {
      print("trnawg");
      final datas= await getDataUsecase.call();
      print("sao");
       emit(SensorLoaded(dataEnttity:datas ));
    }
    on SocketException catch (e) {
      print("8");
      emit(SensorFailure(message: e.toString()));
    }catch (e) {
      print("9");
      print(e.toString());
      emit(SensorFailure(message: e.toString()));
    }
  }
}
