import 'package:firebase_database/firebase_database.dart';
import 'package:smart_farm/data/data_source/remote_data_source.dart';
import 'package:smart_farm/data/model/data_model.dart';
import 'package:smart_farm/domain/entities/data_enttity.dart';

class RemoteDataSourceImpl implements RemoteDataSource{
  final FirebaseDatabase  firebaseDatabase;

  RemoteDataSourceImpl({required this.firebaseDatabase});
  @override
  Future<DataEnttity> getData()async {
    print("2");
    final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('test/');
    print("3");
    DatabaseEvent event = await _dbRef.once();
    DataSnapshot snapshot = event.snapshot;
    print("1");
    if (snapshot.exists) {
      Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
      print(0);
      return DataModel(
        humidity: data['humidity'],
        soilmoisturepercent: data['soilmoisturepercent'],
        soiltemp: data['soiltemp'],
        temperature: data['temperature'],
      );
      
    } else {
      throw Exception('No data found');
    }
    
  }

}