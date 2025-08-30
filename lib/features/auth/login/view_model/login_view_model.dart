import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:animoo_app/features/auth/login/view_model/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel(this.loginRepositiory) : super(LoginInitial());
  final LoginRepository loginRepositiory;
}
