import 'package:firebase_database/firebase_database.dart';
import 'package:smart_farm/domain/entities/data_enttity.dart';
import 'package:smart_farm/domain/repositories/firebase_repository.dart';

class GetDataUsecase{
  final FirebaseRepository repository;

  GetDataUsecase({required this.repository});
  Future<DataEnttity> call() async{
    return await  repository.getData();
  }
}