import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/firebase_pagination_result.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/position_model.dart';

abstract class CompanyRemoteDataSource {
  ///
  /// 회사 리스트 페이지네이션 호출
  ///
  Future<FirebasePaginatedResult<CompanyModel, CompanyModel>>
      getPagedCompanyList({
    required DocumentSnapshot<CompanyModel>? lastDocument,
    required int limit,
    required String orderByField,
    List<FirestoreQueryConstraint>? queryConstraints,
    List<QueryDocumentSnapshot<CompanyModel>>? prevSnapshots,
  });

  ///
  /// 회사 department 리스트 호출
  ///
  Future<List<DepartmentModel>> getDepartments(String companyId);

  ///
  /// 회사 position 리스트 호출
  ///
  Future<List<PositionModel>> getPositions(String companyId);
}
