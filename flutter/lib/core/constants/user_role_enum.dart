///
/// 사용자 권한(Role) 리스트
///
enum UserRoleTypes {
  /// 최고 관리자
  ADMIN('admin', '관리자'),

  /// 관리자
  MANAGER('manager', '원장'),

  /// 일반 사용자
  USER('user', '교사');

  final String key;
  final String description;

  const UserRoleTypes(this.key, this.description);

  /// key 값으로 enum 찾기, 없으면 user 기본값 반환
  static UserRoleTypes getByKey(String key) => values.firstWhere(
        (role) => role.key == key,
    orElse: () => UserRoleTypes.USER,
  );

  bool get isAdmin => this == UserRoleTypes.ADMIN;
  bool get isManager => this == UserRoleTypes.MANAGER;
  bool get isUser => this == UserRoleTypes.USER;
}
