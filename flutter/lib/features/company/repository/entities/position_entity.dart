import 'package:saem_talk_talk/features/company/data_source/remote/models/position_model.dart';

class PositionEntity {
  final String id;
  final String positionName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PositionEntity({
    required this.id,
    required this.positionName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PositionEntity.fromModel(PositionModel model) {
    return PositionEntity(
      id: model.id,
      positionName: model.positionName,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  PositionEntity copyWith({
    String? id,
    String? positionName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PositionEntity(
      id: id ?? this.id,
      positionName: positionName ?? this.positionName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}