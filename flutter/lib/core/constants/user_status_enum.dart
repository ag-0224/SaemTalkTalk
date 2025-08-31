///
/// user status 리스트
///
enum UserStatusTypes {
  /// 기존 회원 (정상 활성화 상태)
  ACTIVE('ACTIVE', '활성 사용자'),

  /// 관리자 승인 대기 중 상태
  NOT_AUTH('NOT_AUTH', '승인 대기 중입니다.'),

  /// 계정 정지 상태 (서비스 이용 제한)
  SUSPENDED('SUSPENDED', '계정이 정지되었습니다.'),

  /// 탈퇴 처리된 상태 (계정 비활성화 및 데이터 보존 여부에 따라 처리)
  DELETED('DELETED', '탈퇴 처리된 사용자'),

  UNDEFINED('UNDEFINED', 'undefined');

  final String key;
  final String value;

  const UserStatusTypes(this.key, this.value);

  static UserStatusTypes getByKey(String key) => values.firstWhere(
        (status) => status.key == key,
    orElse: () => UserStatusTypes.UNDEFINED,
  );

  bool get isExistingUser => this == UserStatusTypes.ACTIVE;
  bool get isPendingApproval => this == UserStatusTypes.NOT_AUTH;
  bool get isSuspended => this == UserStatusTypes.SUSPENDED;
  bool get isDeleted => this == UserStatusTypes.DELETED;
}

