import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';

class CompanyEntity {
  CompanyEntity({
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
  final UserStatusTypes status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CompanyEntity.fromModel(CompanyModel model) {
    return CompanyEntity(
      id: model.id,
      ceoName: model.ceoName,
      ceoUserId: model.ceoUserId,
      companyName: model.companyName,
      email: model.email,
      phoneNumber: model.phoneNumber,
      status: model.status,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  CompanyEntity copyWith({
    String? id,
    String? ceoName,
    String? ceoUserId,
    String? companyName,
    String? email,
    String? phoneNumber,
    UserStatusTypes? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanyEntity(
      id: id ?? this.id,
      ceoName: ceoName ?? this.ceoName,
      ceoUserId: ceoUserId ?? this.ceoUserId,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

