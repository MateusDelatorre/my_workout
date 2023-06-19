part of 'day_bloc.dart';

abstract class DayEvent extends Equatable {
  const DayEvent();
}

class CreateDayEvent extends DayEvent{
  CreateDayEvent({required this.ordem, required this.workoutHash});

  int ordem;
  String workoutHash;

  @override
  List<Object?> get props => [ordem, workoutHash];
}

class UpdateDayEvent extends DayEvent{
  const UpdateDayEvent({required this.day});

  final Day day;

  @override
  List<Object?> get props => [day];
}

class DeleteDayEvent extends DayEvent{
  const DeleteDayEvent({required this.day});

  final Day day;

  @override
  List<Object?> get props => [day];
}