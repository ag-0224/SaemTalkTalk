import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/core/modules/converter/time_stamp_converter.dart';
import 'package:saem_talk_talk/core/modules/converter/user_status_converter.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';

part 'company_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CompanyModel {
  CompanyModel({
    required this.id,
    required this.ceoName,
    required this.ceoUserId,
    required this.companyName,
    required this.email,
    required this.phoneNumber,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;

  final String ceoName;

  final String ceoUserId;

  final String companyName;

  final String email;

  final String phoneNumber;

  @UserStatusConverter()
  final UserStatusTypes status;

  @TimeStampConverter()
  final DateTime? createdAt;

  @TimeStampConverter()
  final DateTime? updatedAt;

  factory CompanyModel.fromEntity(CompanyEntity entity) {
    return CompanyModel(
      id: entity.id,
      ceoName: entity.ceoName,
      ceoUserId: entity.ceoUserId,
      companyName: entity.companyName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory CompanyModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) =>
      CompanyModel.fromJson(snapshot.data()!);

  static Map<String, Object?> toFirestore(CompanyModel model,
      SetOptions? options,) {
    final data = model.toJson();

    return data;
  }

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'ceo_name': ceoName,
      'ceo_user_id': ceoUserId,
      'company_name': companyName,
      'created_at': const TimeStampConverter().toJson(
        createdAt ?? DateTime.now(),
      ),
      'email': email,
      'phone_number': phoneNumber,
      'status': const UserStatusConverter().toJson(status),
      'updated_at': const TimeStampConverter().toJson(
        updatedAt ?? DateTime.now(),
      ),
    };
  }

  Map<String, dynamic> updatedFieldToJson() =>
      {
        'company_name': companyName,
        'email': email,
        'phone_number': phoneNumber,
        'status': status.key,
      };
}
