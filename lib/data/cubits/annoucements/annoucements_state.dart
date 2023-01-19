part of 'annoucements_cubit.dart';

abstract class AnnoucementsState extends Equatable {
  const AnnoucementsState();

  @override
  List<Object> get props => [];
}

class AnnoucementsInitial extends AnnoucementsState {}

class AnnoucementsLoading extends AnnoucementsState {}

class AnnoucementsSuccess extends AnnoucementsState {
  final Annoucements annoucements;

  const AnnoucementsSuccess(this.annoucements);

  @override
  List<Object> get props => [annoucements];
}

class AnnoucementsFailure extends AnnoucementsState {
  final String error;

  const AnnoucementsFailure(this.error);

  @override
  List<Object> get props => [error];
}
