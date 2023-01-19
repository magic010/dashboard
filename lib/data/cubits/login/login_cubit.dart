import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo logInRepo = LoginRepo();

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    final data = await logInRepo.userLogin(email: email, password: password);
    if (data != null) {
      emit(LoginSuccess(data.token!));
    } else {
      emit(const LoginFailure("error"));
    }
  }
}
