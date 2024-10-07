import 'package:smart_farm/domain/entities/data_enttity.dart';

class DataModel extends DataEnttity {
  final double? humidity;
  final double? soilmoisturepercent;
  final double? soiltemp;
  final double? temperature;

  DataModel(
      {this.humidity,
      this.soilmoisturepercent,
      this.soiltemp,
      this.temperature}):super(humidity: humidity,soilmoisturepercent: soilmoisturepercent,soiltemp: soiltemp,temperature: temperature);
  factory DataModel.fromMap(Map<String,dynamic> map){
    return DataModel(
      humidity: map['humidity'],
      soilmoisturepercent: map['soilmoisturepercent'],
      soiltemp: map['soiltemp'],
      temperature: map['temperature']
    );
  }
  
}
