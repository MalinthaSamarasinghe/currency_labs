class RegularExpressions {
  /// Check Numbers Only
  static RegExp numbersOnly = RegExp(r'^[0-9]+$');

  /// Check String And Numbers Only
  static RegExp stringAndNumbersOnly = RegExp(r'^[a-zA-Z0-9]+$');

  /// Check Valid Name
  /// Allowed - en & de characters, spaces
  /// Not Allowed - Special characters, Numbers,
  static RegExp fullName = RegExp(r"^[A-Za-zÀ-ȕ ,.'-]+$");

  /// Check Valid Email
  static RegExp email = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  /// Check Valid Phone Number
  static RegExp phoneNumber = RegExp(r'^0\d{9}$');
}
