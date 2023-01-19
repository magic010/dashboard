part of 'quizes_cubit.dart';

abstract class QuizesState extends Equatable {
  const QuizesState();

  @override
  List<Object> get props => [];
}

class QuizesInitial extends QuizesState {}

class QuizesLoading extends QuizesState {}

class QuizesSuccess extends QuizesState {
  final Quizes quizes;

  const QuizesSuccess(this.quizes);

  @override
  List<Object> get props => [quizes];
}

class QuizesFailure extends QuizesState {
  final String error;

  const QuizesFailure(this.error);

  @override
  List<Object> get props => [error];
}
