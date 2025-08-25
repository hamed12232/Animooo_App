import 'package:animoo_app/core/constant/const_manager.dart';
import 'package:animoo_app/core/models/password_rules.dart';

void _changeRule(int index, bool value) {
  ConstsListsManager.passwordRulesRequirements[index].valid = value;
  changePasswordRules();
}

late Sink<List<PasswordRulesModel>> listPasswordRulesInput;

void changePasswordRules() {
  listPasswordRulesInput.add(ConstsListsManager.passwordRulesRequirements);
}

void onChangePassword(String value) {
  //?check value is less than 12
  if (value.trim().length < 12) {
    _changeRule(0, false);
  } else {
    _changeRule(0, true);
  }
  //?check value contains at least one uppercase letter
  if (!value.trim().contains(RegExp(r"[A-Z]"))) {
    _changeRule(1, false);
  } else {
    _changeRule(1, true);
  }
  //?check value contains at least one lowercase letter
  if (!value.trim().contains(RegExp(r"[a-z]"))) {
    _changeRule(2, false);
  } else {
    _changeRule(2, true);
  }
  //?check value contains at least one special character
  if (!value.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    _changeRule(3, false);
  } else {
    _changeRule(3, true);
  }
  //?check value contains at least one number
  if (!value.trim().contains(RegExp(r"[0-9]"))) {
    _changeRule(4, false);
  } else {
    _changeRule(4, true);
  }
}
