import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/firebase_pagination_result.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/department_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/position_entity.dart';

abstract interface class CompanyRepository {
  ///
  /// Firestore로부터 페이징된 회사 목록 가져오기
  ///
  /// [lastDocument] - 다음 페이지의 시작점이 되는 마지막 문서
  /// [limit] - 한 페이지당 가져올 항목 수
  /// [queryConstraints] - 추가적인 Firestore 쿼리 제약 조건
  ///
  Future<Result<FirebasePaginatedResult<CompanyEntity, CompanyModel>>>
      getPagedCompanyList({
    required int limit,
    required String orderByField,
    DocumentSnapshot<CompanyModel>? lastDocument,
    List<FirestoreQueryConstraint>? queryConstraints,
  });

  Future<Result<List<DepartmentEntity>>> getDepartments(String companyId);

  Future<Result<List<PositionEntity>>> getPositions(String companyId);
}
