extension StringValidationExt on String {
  // 공백 존재 여부
  bool get hasSpace {
    return RegExp(r'\s').hasMatch(this);
  }

  bool get hasProperLength {
    return trim().length < 8 || trim().length > 32;
  }

  /// 적합한 문자 사용 여부
  /// 한글, 알파벳, 숫자, 언더스코어(_), 하이픈(-)만 사용할 수 있음
  bool get hasProperCharacter {
    return !RegExp(r'^[a-zA-Z0-9ㄱ-ㅎ가-힣_-]+$').hasMatch(trim());
  }

  ///
  /// password 여부
  ///
  /// 적합한 문자 사용 여부
  /// 영문 + 숫자 + 특수문자
  ///
  bool get hasProperPasswordCharacter {
    return !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).+$')
        .hasMatch(trim());
  }

  ///
  /// email 여부
  ///
  bool get hasProperEmail {
    return !RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(trim());
  }
}
