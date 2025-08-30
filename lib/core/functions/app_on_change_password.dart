import 'dart:async';
import 'package:animoo_app/core/constant/const_manager.dart';
import 'package:animoo_app/core/models/password_rules.dart';

// Remove the global sink and use a callback approach instead
typedef PasswordRulesCallback = void Function(List<PasswordRulesModel> rules);

PasswordRulesCallback? _passwordRulesCallback;
Timer? _debounceTimer;
// ignore: unused_element
bool _isUpdating = false;

void setPasswordRulesCallback(PasswordRulesCallback callback) {
  _passwordRulesCallback = callback;
}

void clearPasswordRulesCallback() {
  _passwordRulesCallback = null;
  _debounceTimer?.cancel();
}

void _changeRule(int index, bool value) {
  ConstsListsManager.passwordRulesRequirements[index].valid = value;
  // Don't call changePasswordRules here - it will be called once after all updates
}

void changePasswordRules() {
  if (_passwordRulesCallback != null) {
    _passwordRulesCallback!(ConstsListsManager.passwordRulesRequirements);
  }
}

void onChangePassword(String value) {
  // Cancel previous timer to debounce the validation
  _debounceTimer?.cancel();
  
  _debounceTimer = Timer(const Duration(milliseconds: 300), () {
    _isUpdating = true;
    
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
    
    _isUpdating = false;
    // Call changePasswordRules once after all updates
    changePasswordRules();
  });
}
