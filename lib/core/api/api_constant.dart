class ApiConstant {
  
  ApiConstant._();
  static const String baseUrl = "http://192.168.1.4:8000";
  static const String signUp = "/api/signup";
  static const String verifyOtp = "/api/verfication_code";
  static const String forgetPassword = "/api/forget_password";
  static const String resendOtp = "/api/create_new_verfication_code";
  static const String createNewPassword = "/api/create_new_possword";

  static String getLoginUrl(String email, String password) =>
     "/api/login?email=$email&password=$password";
  
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
