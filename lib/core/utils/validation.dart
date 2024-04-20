import 'package:easy_localization/easy_localization.dart';

class Validation {
  Validation._internal();
  static final Validation _instance = Validation._internal();
  factory Validation() => _instance;

  RegExp emailReg = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  String? emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return ("emailValidation".tr());
    } else if (!emailReg.hasMatch(value.trim())) {
      return ('wrongEmailValidation'.tr());
    } else {
      return null;
    }
  }

  RegExp passwordReg = RegExp(
      r'^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$');
  String? validatePassword(String? value) {
    if (value!.trim().isEmpty) {
      return 'passwordValidation'.tr();
    } else {
      if (!passwordReg.hasMatch(value.trim())) {
        return "wrongPasswordValidation".tr();
      } else {
        return null;
      }
    }
  }

  String? phoneValidation(String? value) {
    String p = r'^(5|50|53|56|54|59|51|58|57)([0-9]{8})$';

    RegExp regExp = RegExp(p);
    if (value!.trim().isEmpty) {
      return ('phoneValidation'.tr());
    } else if (!regExp.hasMatch(value.trim())) {
      return ('wrongPhoneValidation'.tr());
    } else {
      return null;
    }
  }

  String? confirmPasswordValidation(value, String password) {
    if (value!.isEmpty) {
      return 'confirmPasswordValidation'.tr();
    } else if (password != value) {
      return ('wrongConfirmPasswordValidation'.tr());
    } else {
      return null;
    }
  }

  String? defaultValidation(value) {
    if (value!.isEmpty) {
      return ("requiredField".tr());
    } else {
      return null;
    }
  }

  String? otpValidation(value, String otp) {
    if (value!.isEmpty) {
      return ("enterCodeOtp".tr());
    } else if (otp != value) {
      return ("wrongCodeOtp".tr());
    } else {
      return null;
    }
  }

  String? defaultNumberValidation(String? value, int highestNumber) {
    if (value!.isEmpty) {
      return ("requiredField".tr());
    }
    if ((int.tryParse(value) ?? 0) > highestNumber ||
        (int.tryParse(value) ?? 0) < 0) {
      return ("numberValidate".tr() + highestNumber.toString());
    } else {
      return null;
    }
  }

  String? nationalIdValidation(value) {
    if (value!.isEmpty) {
      return ("requiredField".tr());
    } else if (value.length < 8) {
      return ("length".tr());
    } else {
      return null;
    }
  }

  String? makingVisitValidation(value) {
    if (value!.isEmpty || value.length < 4) {
      return ("requiredField".tr());
    } else {
      return null;
    }
  }

  String? numberdefaultValidation(value) {
    if (value!.isEmpty) {
      return ("requiredField".tr());
    } else if (value == "0") {
      return ("bigerThanZero".tr());
    } else {
      return null;
    }
  }

  String? defaultValidationPassword(value) {
    if (value!.isEmpty) {
      return ("passwordValidation".tr());
    } else {
      return null;
    }
  }

  String? defaultValidationName(value) {
    if (value!.isEmpty) {
      return ("nameValidation".tr());
    } else {
      return null;
    }
  }

  String? defaultValidationNameAndLength(value) {
    if (value!.isEmpty) {
      return ("nameValidation".tr());
    } else if (value.length < 10) {
      return ("wrongNameValidation".tr());
    } else {
      return null;
    }
  }
}
