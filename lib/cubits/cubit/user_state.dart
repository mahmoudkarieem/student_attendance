part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class SignInSucces extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignInLoading extends UserState {}

//////////////
///
///

final class SignUpSuccess extends UserState {
  // final String message;

  // SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

///////////
final class ScanSuccess extends UserState {





}

final class ScanFailure extends UserState {
  final dynamic errMessage;

  ScanFailure({required this.errMessage});

}

final class ScanLoading extends UserState {}
////////////////////////////////////



class ResetPasswordLoading extends UserState {}

class ResetPasswordSuccess extends UserState {}

class ResetPasswordFailure extends UserState {
  final String errMessage;

  ResetPasswordFailure({required this.errMessage});
}