import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/member_model.dart';

class MemberEntity {
  final String uid;

  final String name;

  final String? department;

  final String? position;

  final UserStatusTypes status;

  const MemberEntity({
    required this.uid,
    required this.name,
    this.department,
    this.position,
    required this.status,
  });

  factory MemberEntity.fromModel(MemberModel model) {
    return MemberEntity(
      uid: model.uid,
      name: model.name,
      department: model.department,
      position: model.position,
      status: model.status,
    );
  }

  MemberEntity copyWith({
    String? uid,
    String? name,
    String? department,
    String? position,
    UserStatusTypes? status,
  }) {
    return MemberEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      department: department ?? this.department,
      position: position ?? this.position,
      status: status ?? this.status,
    );
  }
}