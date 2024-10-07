part of 'weather_bloc_dart_bloc.dart';

sealed class WeatherBlocDartState extends Equatable {
  const WeatherBlocDartState();
  
  @override
  List<Object> get props => [];
}

final class WeatherBlocDartInitial extends WeatherBlocDartState {}
final class WeatherBlocDartLoading extends WeatherBlocDartState {}
final class WeatherBlocDartFailure extends WeatherBlocDartState {}
final class WeatherBlocDartSuccesss extends WeatherBlocDartState {
  final Weather weather;
  WeatherBlocDartSuccesss({
    required this.weather
  });
   @override
  List<Object> get props => [weather];
}

