part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;
  const RegisterErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ChangeAcceptTermsState extends RegisterState {
  final bool value;
  const ChangeAcceptTermsState(this.value);

  @override
  List<Object> get props => [value];
}

class ChangeProfileImageState extends RegisterState {
  final String image;
  const ChangeProfileImageState(this.image);

  @override
  List<Object> get props => [image];
}

/// Verfiy Email

class VerifyEmailLoadingState extends RegisterState {}

class VerifyEmailSuccessState extends RegisterState {}

class VerifyEmailErrorState extends RegisterState {
  final String error;
  const VerifyEmailErrorState(this.error);
}
