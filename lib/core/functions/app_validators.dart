class AppValidators {
  static String? firstNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    } else if (value.length < 3) {
      return "First name must be at least three letters";
    } else {
      return null;
    }
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    } else if (isPhoneNumber(value) == false) {
      return "Please enter a valid phone number";
    } else {
      return null;
    }
  }

  static bool isPhoneNumber(String value) {
    final phoneRegEx = RegExp(r'^01[0125]\d{8}$'); //010 or 011 or 012 or 015
    return phoneRegEx.hasMatch(value);
  }

  static String? lastNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    } else if (value.length < 3) {
      return "Last name must be at least three letters";
    } else {
      return null;
    }
  }

  static emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    } else if (isEmail(value) == false) {
      return "Please enter a valid email address";
    } else {
      return null;
    }
  }

  static bool isEmail(String value) {
    final emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegEx.hasMatch(value);
  }

  static passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    } else if (isPassword(value) == false) {
      return "Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number.";
    } else {
      return null;
    }
  }

  static confirmPasswordValidator(
    String? valuePassword,
    String? valueConfirmPassword,
  ) {
    if (valuePassword == null || valuePassword.trim().isEmpty) {
      return "This field is required";
    } else if (valuePassword != valueConfirmPassword) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }

  static bool isPassword(String value) {
    final passwordRegEx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    );

    return passwordRegEx.hasMatch(value);
  }
}
