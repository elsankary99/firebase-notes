abstract class SignUpState {
  const SignUpState();
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class TermsAndConditionState extends SignUpState {}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError(this.message);
}
