part of 'sensor_cubit.dart';

sealed class SensorState extends Equatable {
  const SensorState();

  
}

final class SensorInitial extends SensorState {
  @override
  List<Object> get props => [];
}

final class SensorLoaded extends SensorState {
  final DataEnttity dataEnttity;

  SensorLoaded({required this.dataEnttity});

  @override
  List<Object> get props => [];
}

final class SensorLoading extends SensorState {
  @override
  List<Object> get props => [];
}

final class SensorFailure extends SensorState {
  final String message;

  SensorFailure({required this.message});
  @override
  List<Object> get props => [message];
}
