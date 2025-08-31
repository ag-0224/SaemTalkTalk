extension StringExtensions on String {
  ///
  /// 두 개 이상의 문자열을 포함하는지 확인하는 메소드
  ///
  bool containsMultiple(List<String> substrings) {
    return substrings.any(contains);
  }

  ///
  /// 검색일치 여부를 확인하기 위한
  /// 정제된 문자열로 변환하는 메소드
  ///
  String get toSearchableStr =>
      replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '').toLowerCase();

  ///
  /// 한국어 포함 여부
  ///
  bool get containsKorean {
    RegExp koreanRegExp = RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]');

    return koreanRegExp.hasMatch(this);
  }

  ///
  /// 문자열의 첫 번째 글자가 영어로 시작하는지 여부
  ///
  bool get startsWithEnglish {
    if (isEmpty) {
      return false;
    }

    int firstCharCode = codeUnitAt(0);
    return (firstCharCode >= 65 && firstCharCode <= 90) ||
        (firstCharCode >= 97 && firstCharCode <= 122);
  }

  ///
  /// '-' 문자열을 기준으로 주어진 문자여을 나누고
  /// 나누어진 첫 번째 부분의 문자열을 리턴하는 메소드
  /// ex) 'swift-32' -> 'swift'
  ///
  String get getFirstPartOfSpliited {
    List<String> parts = split('-');
    return parts[0];
  }

  ///
  /// 문자열에 완전히 비어 있는지 확인하는 메소드
  ///
  bool get isNotEntirelyEmpty {
    return isNotEmpty && this != '';
  }

  ///
  /// 검색 조건을 위해
  /// (-), '(공백)'을 제거하고
  /// lowerCase
  ///
  String get normalizeSearchString =>
      replaceAll(RegExp(r'[- ]'), '').toLowerCase();

  ///
  /// 한국 전화번호에 하이픈을 넣어주는 메소드
  ///
  String get formatAsPhoneNumber {
    final number = replaceAll(RegExp(r'\D'), ''); // 숫자만 추출

    if (number.startsWith('02')) {
      // 서울 02 지역번호
      if (number.length == 9) return '${number.substring(0, 2)}-${number.substring(2, 5)}-${number.substring(5)}';
      if (number.length == 10) return '${number.substring(0, 2)}-${number.substring(2, 6)}-${number.substring(6)}';
    } else {
      // 기타 지역번호
      if (number.length == 10) return '${number.substring(0, 3)}-${number.substring(3, 6)}-${number.substring(6)}';
      if (number.length == 11) return '${number.substring(0, 3)}-${number.substring(3, 7)}-${number.substring(7)}';
    }

    return this; // 해당되지 않으면 원본 반환
  }
}