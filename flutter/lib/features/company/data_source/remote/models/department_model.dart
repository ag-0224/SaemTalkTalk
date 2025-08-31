import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/modules/converter/time_stamp_converter.dart';
import 'package:saem_talk_talk/features/company/repository/entities/department_entity.dart';

part 'department_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class DepartmentModel {
  DepartmentModel({
    required this.id,
    required this.departmentName,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;

  final String departmentName;

  @TimeStampConverter()
  final DateTime createdAt;

  @TimeStampConverter()
  final DateTime updatedAt;

  DepartmentEntity toEntity() {
    return DepartmentEntity(
      id: id,
      departmentName: departmentName,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory DepartmentModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) =>
      DepartmentModel.fromJson(snapshot.data()!);

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return _$DepartmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DepartmentModelToJson(this);
}