import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/core/modules/converter/user_status_converter.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';

part 'member_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MemberModel {
  MemberModel({
    required this.uid,
    required this.name,
    this.department,
    this.position,
    required this.status,
  });

  final String uid;

  final String name;

  final String? department;

  final String? position;

  @UserStatusConverter()
  final UserStatusTypes status;

  factory MemberModel.fromEntity(MemberEntity entity) {
    return MemberModel(
      uid: entity.uid,
      name: entity.name,
      department: entity.department,
      position: entity.position,
      status: entity.status,
    );
  }

  MemberEntity toEntity() {
    return MemberEntity(
      uid: uid,
      name: name,
      department: department,
      position: position,
      status: status,
    );
  }

  factory MemberModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) =>
      MemberModel.fromJson(snapshot.data()!);

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return _$MemberModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MemberModelToJson(this);
}