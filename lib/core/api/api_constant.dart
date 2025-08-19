class ApiConstant {
  ApiConstant._();
  static const String baseUrl = "http://127.0.0.1:8000";
  static const String login = "$baseUrl/api/login";
  static const String signUp = "$baseUrl/api/signup";
  static const String verifyEmail = "$baseUrl/auth/verify-email";
  static const String forgotPassword = "$baseUrl/auth/forgot-password";
  static const String resetPassword = "$baseUrl/auth/reset-password";
}