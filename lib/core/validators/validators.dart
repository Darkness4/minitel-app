extension Validators on String {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static final RegExp _onlyNumbersRegExp = RegExp(
    r'^[0-9]+$',
  );

  bool get isValidEmail {
    return _emailRegExp.hasMatch(this);
  }

  bool get containsOnlyNumbers {
    return _onlyNumbersRegExp.hasMatch(this);
  }

  bool get containsNoNumbers {
    return !containsOnlyNumbers;
  }

  bool get isValidEmseUsername {
    return contains('.') && !contains('@');
  }

  bool get isNotValidEmseUsername {
    return !isValidEmseUsername;
  }
}
