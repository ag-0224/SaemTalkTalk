import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/modules/converter/time_stamp_converter.dart';
import 'package:saem_talk_talk/features/company/repository/entities/position_entity.dart';

part 'position_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PositionModel {
  PositionModel({
    required this.id,
    required this.positionName,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;

  final String positionName;

  @TimeStampConverter()
  final DateTime createdAt;

  @TimeStampConverter()
  final DateTime updatedAt;

  PositionEntity toEntity() {
    return PositionEntity(
      id: id,
      positionName: positionName,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory PositionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) =>
      PositionModel.fromJson(snapshot.data()!);

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return _$PositionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PositionModelToJson(this);
}