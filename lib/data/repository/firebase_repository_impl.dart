import 'package:firebase_database/firebase_database.dart';
import 'package:smart_farm/data/data_source/remote_data_source.dart';
import 'package:smart_farm/domain/entities/data_enttity.dart';
import 'package:smart_farm/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{
  final RemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});
  @override
  Future<DataEnttity> getData() async=>remoteDataSource.getData();

}