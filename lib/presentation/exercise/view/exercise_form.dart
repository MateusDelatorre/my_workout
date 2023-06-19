import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/exercise/bloc/exercise_bloc.dart';
import 'package:my_workout/presentation/widgets/presenter.dart';

class ExerciseForm extends StatelessWidget {
  const ExerciseForm({Key? key, required this.dayHash}) : super(key: key);

  final String dayHash;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciseBloc, ExerciseState>(
      listener: (context, state){
        if(state is ExerciseCreatedState){
          Navigator.of(context).pop();
          Presenter().showSnackBar(context, Presenter().showSuccess('Exercicio criado'));
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _SeriesInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _RepetitionInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _CreateExerciseButton(dayHash: dayHash,),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('ExerciseForm_nameInput_textField'),
          onChanged: (name) =>
              context.read<ExerciseBloc>().add(ExerciseNameChangedEvent(name)),
          decoration: const InputDecoration(
            labelText: 'name',
            //state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _SeriesInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) => previous.series != current.series,
      builder: (context, state) {
        return TextField(
          key: const Key('ExerciseForm_seriesInput_textField'),
          keyboardType: TextInputType.number,
          onChanged: (series) =>
              context.read<ExerciseBloc>().add(ExerciseSeriesChangedEvent(int.parse(series))),
          decoration: const InputDecoration(
            labelText: 'series',
            //state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _RepetitionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      buildWhen: (previous, current) => previous.repetitions != current.repetitions,
      builder: (context, state) {
        return TextField(
          key: const Key('ExerciseForm_repetitionInput_textField'),
          keyboardType: TextInputType.number,
          onChanged: (repetitions) =>
              context.read<ExerciseBloc>().add(ExerciseRepetitionsChangedEvent(int.parse(repetitions))),
          decoration: const InputDecoration(
            labelText: 'repetitions',
            //state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _CreateExerciseButton extends StatelessWidget {
  const _CreateExerciseButton({Key? key, required this.dayHash}) : super(key: key);

  final String dayHash;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<ExerciseBloc>().add(CreateExerciseEvent(
                dayHash: dayHash,
                name: state.name,
                series: state.series,
                repetitions: state.repetitions
            ));
          },
          child: const Text('Create'),
        );
      },
    );
  }
}