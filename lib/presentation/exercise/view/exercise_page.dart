import 'package:flutter/material.dart';
import 'package:my_workout/presentation/exercise/view/exercise_form.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({Key? key, required this.dayHash}) : super(key: key);

  final String dayHash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar treino"),
      ),
      body: ExerciseForm(dayHash: dayHash,),
    );
  }
}