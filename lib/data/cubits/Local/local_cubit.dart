import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/CacheHelper.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  var locale = const Locale('en');
  LocalCubit() : super(LocalInitial());
  Future<void> changeLanguage(String languageCode) async {
    if (languageCode == 'ar') {
      locale = const Locale('ar');
      await CacheHelper.saveToShared("LOCALE", languageCode);
    } else {
      locale = const Locale('en');
      await CacheHelper.saveToShared("LOCALE", languageCode);
    }

    emit(ChangeLocaleState(local: Locale(languageCode)));
  }

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await CacheHelper.getLangCode();

    emit(ChangeLocaleState(local: Locale(cachedLanguageCode)));
  }

  static LocalCubit get(context) => BlocProvider.of(context);
}
