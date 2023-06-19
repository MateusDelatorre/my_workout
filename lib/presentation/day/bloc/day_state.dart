part of 'day_bloc.dart';

class DayState extends Equatable {
  const DayState({this.day = const Day(hash: '', day: 0, exercises: [])});

  final Day day;

  DayState copyWith({
    String? hash,
    int? day,
    List<Exercise>? exercises,
  }) {
    return DayState(
      day: Day(hash: hash ?? '', day: day ?? 0, exercises: exercises ?? [])
    );
  }
  @override
  List<Object> get props => [day.hash, day.day, day.exercises];
}

class DayLoadedState extends DayState{
  const DayLoadedState({super.day}) : super();
}

class DayLoadingState extends DayState {
  const DayLoadingState() : super();
}

class DayErrorState extends DayState {
  const DayErrorState() : super();
}




