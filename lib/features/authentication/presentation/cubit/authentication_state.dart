part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoadingState extends AuthenticationState {}

final class AuthenticationErrorState extends AuthenticationState {}

final class AuthenticationSuccessfulState extends AuthenticationState {}
