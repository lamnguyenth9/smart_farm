import 'package:equatable/equatable.dart';

class DataEnttity extends Equatable {
  final double? humidity;
  final double? soilmoisturepercent;
  final double? soiltemp;
  final double? temperature;

  DataEnttity(
      {this.humidity, this.soilmoisturepercent, this.soiltemp, this.temperature});

  @override
  // TODO: implement props
  List<Object?> get props => [
    humidity,soilmoisturepercent,soiltemp,temperature
  ];
}
