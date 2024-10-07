import 'package:firebase_database/firebase_database.dart';

import '../../domain/entities/data_enttity.dart';

abstract class RemoteDataSource{
   Future<DataEnttity> getData();
}