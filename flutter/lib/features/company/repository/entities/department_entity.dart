import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';

class DepartmentEntity {
  final String id;
  final String departmentName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DepartmentEntity({
    required this.id,
    required this.departmentName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DepartmentEntity.fromModel(DepartmentModel model) {
    return DepartmentEntity(
      id: model.id,
      departmentName: model.departmentName,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  DepartmentEntity copyWith({
    String? id,
    String? positionName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DepartmentEntity(
      id: id ?? this.id,
      departmentName: positionName ?? this.departmentName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}