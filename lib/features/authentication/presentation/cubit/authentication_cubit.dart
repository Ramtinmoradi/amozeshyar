import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  FutureOr<void> checkUser({required String username, required String password}) {
    emit(AuthenticationLoadingState());
    Future.delayed(Duration(milliseconds: 500));
    if (username == 'edu@110972125577' && password == 'ramtin2388') {
      emit(AuthenticationSuccessfulState());
    } else {
      emit(AuthenticationErrorState());
    }
  }
}
