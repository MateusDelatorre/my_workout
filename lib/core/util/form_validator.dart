class FormValidator {
  static bool validate({required String email, required String password}){
    if(_EmailValidator.emailValidation(email)){
      return _PasswordValidator.passwordValidation(password);
    }else{
      return false;
    }
  }
}

class _EmailValidator{
  static bool emailValidation(String email) {
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return true;
    }
    return true;
  }
}

class _PasswordValidator{
  static bool passwordValidation(String password) {
    if (RegExp(r"^.{8,}$").hasMatch(password)) {
      return true;
    }
    return false;
  }
}
