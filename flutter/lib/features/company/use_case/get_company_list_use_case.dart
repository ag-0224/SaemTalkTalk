import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/firebase_pagination_result.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/core/modules/base_use_case/base_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';

import '../data_source/remote/models/company_model.dart';

///
/// 회사 리스트를 불러오는 파라미터
///
final class GetCompanyListParams {
  final DocumentSnapshot<CompanyModel>? lastDocument;
  final int limit;
  final List<FirestoreQueryConstraint>? queryConstraints;
  final String orderByField;

  GetCompanyListParams({
    required this.limit,
    required this.orderByField,
    this.lastDocument,
    this.queryConstraints,
  });
}

///
/// 회사 컨텐츠 리스트 페이이네이션
///
final class GetCompanyListUseCase extends BaseUseCase<
    GetCompanyListParams,
    Result<FirebasePaginatedResult<CompanyEntity, CompanyModel>>> {
  GetCompanyListUseCase(this._repository);

  final CompanyRepository _repository;

  @override
  Future<Result<FirebasePaginatedResult<CompanyEntity, CompanyModel>>>
  call(
      GetCompanyListParams request,
      ) =>
      _repository.getPagedCompanyList(
        lastDocument: request.lastDocument,
        limit: request.limit,
        orderByField: request.orderByField,
        queryConstraints: request.queryConstraints,
      );
}