import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_farm/bloc/weather_bloc_dart_bloc.dart';
import 'package:smart_farm/data/data_source/remote_data_source.dart';
import 'package:smart_farm/data/data_source/remote_data_source_impl.dart';
import 'package:smart_farm/domain/usecases/get_data_usecase.dart';
import 'package:smart_farm/presentation/cubit/cubit/sensor_cubit.dart';

import 'data/repository/firebase_repository_impl.dart';
import 'domain/repositories/firebase_repository.dart';

final sl=GetIt.instance;

Future<void> init() async{
  sl.registerFactory<WeatherBlocDartBloc>(()=>WeatherBlocDartBloc());
  sl.registerFactory<SensorCubit>(()=>SensorCubit(getDataUsecase: sl.call()));
  sl.registerLazySingleton<GetDataUsecase>(()=>GetDataUsecase(repository: sl.call()));
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<RemoteDataSource>(()=>RemoteDataSourceImpl(firebaseDatabase: sl.call()));
  final firebaseDatabase=FirebaseDatabase.instance;
  sl.registerLazySingleton(()=>firebaseDatabase);
}
