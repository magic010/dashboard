import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/quizes/quizes.dart';
import '../../repositories/quizes.dart';

part 'quizes_state.dart';

class QuizesCubit extends Cubit<QuizesState> {
  QuizesCubit() : super(QuizesInitial());

  quizesRepo quizesRepoData = quizesRepo();

  Future<void> getQuizes() async {
    emit(QuizesLoading());
    final data = await quizesRepoData.getQuizes();
    if (data!.data != null) {
      emit(QuizesSuccess(data));
    } else {
      emit(const QuizesFailure("error"));
    }
  }
}
