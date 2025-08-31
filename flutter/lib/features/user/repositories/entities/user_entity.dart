import 'package:saem_talk_talk/core/modules/converter/time_stamp_converter.dart';
import 'package:saem_talk_talk/features/user/user.dart';

class UserEntity {
  /// 유저 UID
  final String uid;

  /// Locale
  final String? locale;

  /// 유저 이메일
  final String email;

  /// 유저 이미지 경로
  final String? profileImgUrl;

  /// 유저 이름
  final String name;

  /// 유저 활성화 상태
  final String status;

  /// 유저 회사
  final String company;

  /// 유저 role
  final String role;

  /// 유저 직급
  final String? position;

  /// 유저 부서
  final String? department;

  /// 접속 횟수
  final int? loginCount;

  /// 유저 가입일
  final DateTime signUpDate;

  /// 유저 마지막 로그인 시간
  final DateTime lastLoginDate;

  const UserEntity({
    required this.uid,
    this.locale,
    required this.email,
    this.profileImgUrl,
    required this.name,
    required this.status,
    required this.company,
    required this.role,
    this.position,
    this.department,
    this.loginCount,
    required this.signUpDate,
    required this.lastLoginDate,
  });

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      uid: model.uid,
      locale: model.locale,
      email: model.email,
      profileImgUrl: model.profileImgUrl,
      name: model.name,
      status: model.status,
      company: model.company,
      role: model.role,
      position: model.position,
      department: model.department,
      loginCount: model.loginCount ?? 0,
      signUpDate: model.signUpDate,
      lastLoginDate: model.lastLoginDate,
    );
  }

  UserEntity copyWith({
    String? uid,
    String? locale,
    String? email,
    String? profileImgUrl,
    String? name,
    String? status,
    String? company,
    String? role,
    String? position,
    String? department,
    int? loginCount,
    DateTime? signUpDate,
    DateTime? lastLoginDate,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      locale: locale ?? this.locale,
      email: email ?? this.email,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      name: name ?? this.name,
      status: status ?? this.status,
      company: company ?? this.company,
      role: role ?? this.role,
      position: position ?? this.position,
      department: department ?? this.department,
      loginCount: loginCount ?? this.loginCount,
      signUpDate: signUpDate ?? this.signUpDate,
      lastLoginDate: lastLoginDate ?? this.lastLoginDate,
    );
  }
}
