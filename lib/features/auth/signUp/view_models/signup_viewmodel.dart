import 'package:animoo_app/features/auth/signUp/view_models/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewmodel extends Cubit<SignupState> {
  SignupViewmodel() : super(SignupInitial());

}