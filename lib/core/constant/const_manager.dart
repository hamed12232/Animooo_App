
import 'package:animoo_app/core/models/password_rules.dart';

class ConstsListsManager {
  static List<PasswordRulesModel> passwordRulesRequirements = [
    PasswordRulesModel(title: 'Minimum characters 12', valid: false),
    PasswordRulesModel(title: 'One uppercase character', valid: false),
    PasswordRulesModel(title: 'One lowercase character', valid: false),
    PasswordRulesModel(title: 'One special character', valid: false),
    PasswordRulesModel(title: 'One number', valid: false),
  ];
}