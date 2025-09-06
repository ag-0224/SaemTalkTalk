sealed class CustomException implements Exception {
  const CustomException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => '$code: $message';
}

class UnAuthorizedException extends CustomException {
  const UnAuthorizedException() : super('000000', '유저 인증 정보를 불러올 수 없습니다.');
}

class AlreadyExistUserDataException extends CustomException {
  const AlreadyExistUserDataException() : super('100001', '이미 유저 데이터가 존재합니다.');
}

class NoUserDataException extends CustomException {
  const NoUserDataException() : super('100002', '유저 데이터가 존재하지않습니다.');
}

class NoCompanyDataException extends CustomException {
  const NoCompanyDataException() : super('500002', '회사 데이터가 존재하지않습니다.');
}

class AlreadyExistCompanyDataException extends CustomException {
  const AlreadyExistCompanyDataException() : super('500001', '이미 회사 데이터가 존재합니다.');
}

class FetchCompanyListOverviewException extends CustomException {
  const FetchCompanyListOverviewException()
      : super('500009', '회사 목록 리스트를 불러오는 데 실패하였습니다.');
}


