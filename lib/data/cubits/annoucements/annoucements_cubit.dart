import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Models/annoucements/annoucements.dart';
import '../../repositories/annoucements_repo.dart';

part 'annoucements_state.dart';

class AnnoucementsCubit extends Cubit<AnnoucementsState> {
  AnnoucementsCubit() : super(AnnoucementsInitial());

  Future<void> getAnnoucements() async {
    emit(AnnoucementsLoading());
    final data = await AnnoucementsRepo().getAnnoucements();
    if (data != null) {
      emit(AnnoucementsSuccess(data));
    } else {
      emit(const AnnoucementsFailure("error"));
    }
  }
}
