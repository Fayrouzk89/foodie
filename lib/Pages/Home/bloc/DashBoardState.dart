import 'package:equatable/equatable.dart';
import 'package:realstic/Common/Restaurant.dart';



abstract class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object?> get props => [];
}

class DashBoardInitial extends DashBoardState {}

class CovidLoading extends DashBoardState {}

class DataLoading extends DashBoardState {}
class DataLoaded extends DashBoardState {}

class DashBoardLoaded extends DashBoardState {
  final List<Restaurant> Model;
  const DashBoardLoaded(this.Model);
}

class CovidError extends DashBoardState {
  final String? message;
  const CovidError(this.message);
}
