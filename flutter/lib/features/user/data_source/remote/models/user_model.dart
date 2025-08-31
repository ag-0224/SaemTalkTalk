import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saem_talk_talk/core/modules/converter/time_stamp_converter.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserModel {
  UserModel({
    required this.uid,
    required this.signUpDate,
    required this.lastLoginDate,
    this.loginCount,
    this.locale,
    required this.email,
    this.profileImgUrl,
    required this.name,
    required this.status,
    required this.company,
    required this.role,
    this.position,
    this.department,
  });

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
  @TimeStampConverter()
  final DateTime signUpDate;

  /// 유저 마지막 로그인 시간
  @TimeStampConverter()
  final DateTime lastLoginDate;

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
        uid: entity.uid,
        signUpDate: entity.signUpDate,
        lastLoginDate: entity.lastLoginDate,
        email: entity.email,
        name: entity.name,
        status: entity.status,
        company: entity.company,
        role: entity.role);
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) =>
      UserModel.fromJson(snapshot.data()!);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> updatedFieldToJson() => {
        'profile_img_url': profileImgUrl,
        'name': name,
        'locale_code': locale,
        'position': position,
        'department': department,
      };
}
