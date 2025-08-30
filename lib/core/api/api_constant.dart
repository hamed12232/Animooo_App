class ApiConstant {
  ApiConstant._();
  static const String baseUrl = "http://10.0.2.2:8000";
  static const String login = "api/login";
  static const String signUp = "/api/signup";
  static const String verifyOtp = "/api/verfication_code";
  static const String forgetPassword = "/api/forget_password";
  static const String resendOtp = "/api/create_new_verfication_code";
  static const String createNewPassword = "/api/create_new_possword";
}

class ApiKeys {
  ApiKeys._();
  static const String email = "email";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
  static const String image = "image";
  static const String phoneNumber = "phone";
  static const String code = "code";
}
