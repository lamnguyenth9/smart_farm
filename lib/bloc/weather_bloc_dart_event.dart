part of 'weather_bloc_dart_bloc.dart';

sealed class WeatherBlocDartEvent extends Equatable {
  const WeatherBlocDartEvent();

  @override
  List<Object> get props => [];
}
final class FetchWeather extends WeatherBlocDartEvent{
  final Position position;
  FetchWeather(this.position);
  @override
  List<Object> get props => [position];

}
