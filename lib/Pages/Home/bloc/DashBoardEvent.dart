import 'package:equatable/equatable.dart';




abstract class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object> get props => [];
}

class GetDashBoardInitial extends DashBoardEvent {}
class UpdateData extends DashBoardEvent {}




