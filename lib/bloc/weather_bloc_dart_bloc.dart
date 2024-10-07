import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_dart_event.dart';
part 'weather_bloc_dart_state.dart';

class WeatherBlocDartBloc extends Bloc<WeatherBlocDartEvent, WeatherBlocDartState> {
  WeatherBlocDartBloc() : super(WeatherBlocDartInitial()) {
    on<FetchWeather>((event, emit) async{
      emit(WeatherBlocDartLoading());
      try{
        WeatherFactory wf = WeatherFactory("9207624429f81b9e27d6b3e11897bd2c",language: Language.ENGLISH);
        
        Weather weather = await wf.currentWeatherByLocation(event.position.latitude,event.position.longitude);
        print(weather);
       emit(WeatherBlocDartSuccesss(weather: weather));
      }catch(e){
        emit(WeatherBlocDartFailure());
      }
    });
  }
}
