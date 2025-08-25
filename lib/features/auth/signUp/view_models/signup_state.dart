import 'package:animoo_app/features/auth/signUp/models/signup_model.dart';

abstract class SignupState {}
class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {
    final AuthResponse authResponse;
    SignupSuccess({required this.authResponse});
}
class SignupError extends SignupState {
  final String message;
  SignupError(this.message);
}