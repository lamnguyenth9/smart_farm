import 'package:firebase_database/firebase_database.dart';
import 'package:smart_farm/domain/entities/data_enttity.dart';

abstract class FirebaseRepository{
  Future<DataEnttity> getData();
}