// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_workout/data/datasources/local/workout_local_data_source.dart';
import 'package:my_workout/domain/entities/workout.dart';

import 'package:my_workout/main.dart';

import 'workout_mock.dart';

void main() {
  final workoutLocalDataSource = WorkoutLocalDataSource();

  test('Hive Open collection', () async {
    // Build our app and trigger a frame.
    bool result = await workoutLocalDataSource.openCollection();
    expect(result, true);
  });

  test('Hive Save workout', () async {
    final result = await workoutLocalDataSource.saveWorkout(WorkoutMock().getMockWorkout());
    expect(result.isRight(), true);
  });

  // test('Hive Open collection', () async {
  //   // Build our app and trigger a frame.
  //   await workoutLocalDataSource.openCollection();
  // });
  //
  // test('Hive Open collection', () async {
  //   // Build our app and trigger a frame.
  //   await workoutLocalDataSource.openCollection();
  // });


}
