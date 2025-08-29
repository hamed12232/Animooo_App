import 'package:animoo_app/features/auth/login/repo/login_repositiory_imp.dart';
import 'package:animoo_app/features/auth/login/view_model/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel(this.loginRepositioryImp) : super(LoginInitial());
  final LoginRepositioryImp loginRepositioryImp;
}
