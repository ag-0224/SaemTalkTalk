import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/firebase_pagination_result.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/core/modules/exceptions/custom_exception.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/company_remote_data_source.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/department_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/position_entity.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  CompanyRepositoryImpl(this._companyRemoteDataSource);

  final CompanyRemoteDataSource _companyRemoteDataSource;

  @override
  Future<Result<FirebasePaginatedResult<CompanyEntity, CompanyModel>>>
      getPagedCompanyList(
          {required int limit,
          required String orderByField,
          DocumentSnapshot<CompanyModel>? lastDocument,
          List<FirestoreQueryConstraint>? queryConstraints}) async {
    try {
      // Remote DataSource에서 페이징된 데이터 가져오기
      final remotePaginatedResult =
          await _companyRemoteDataSource.getPagedCompanyList(
        limit: limit,
        orderByField: orderByField,
        lastDocument: lastDocument,
        queryConstraints: queryConstraints,
      );

      // 모델을 엔티티로 변환
      final entities = remotePaginatedResult.items.map((model) {
        return CompanyEntity.fromModel(model);
      }).toList();

      // 엔티티로 페이징된 결과 생성
      final paginatedResult =
          FirebasePaginatedResult<CompanyEntity, CompanyModel>(
        items: entities,
        lastDocument: remotePaginatedResult.lastDocument,
        hasMore: remotePaginatedResult.hasMore,
        hasReversedQueryCallProceeded:
            remotePaginatedResult.hasReversedQueryCallProceeded,
      );

      return Result.success(paginatedResult);
    } on Exception catch (e) {
      log('getCompanyListOverviews : $e');
      return Result.failure(
        const FetchCompanyListOverviewException(),
      );
    }
  }

  @override
  Future<Result<List<DepartmentEntity>>> getDepartments(String companyId) async {
    try {
      final response = await _companyRemoteDataSource.getDepartments(companyId);

      final result =
          response.map((model) => DepartmentEntity.fromModel(model)).toList();

      return Result.success(result);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<PositionEntity>>> getPositions(String companyId) async {
    try {
      final response = await _companyRemoteDataSource.getPositions(companyId);

      final result =
      response.map((model) => PositionEntity.fromModel(model)).toList();

      return Result.success(result);
    } catch (e) {
      return Result.failure(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> createCompany(CompanyEntity data) async {
    try {
      final createdCompany = await _companyRemoteDataSource.createCompany(data);

      return Result.success(createdCompany);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> createMember(MemberEntity data, String companyId) async {
    try {
      final createdMember = await _companyRemoteDataSource.createMember(data, companyId);

      return Result.success(createdMember);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}