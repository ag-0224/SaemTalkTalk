import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/firebase_pagination_result.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/core/query_constraints_applier.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/companies_ref.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/company_remote_data_source.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/department_model.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/position_model.dart';

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final QueryConstraintApplier _constraintApplier;

  CompanyRemoteDataSourceImpl(this._constraintApplier);

  @override
  Future<FirebasePaginatedResult<CompanyModel, CompanyModel>>
      getPagedCompanyList({
    required DocumentSnapshot<CompanyModel>? lastDocument,
    required int limit,
    required String orderByField,
    List<FirestoreQueryConstraint>? queryConstraints,
    List<QueryDocumentSnapshot<CompanyModel>>? prevSnapshots,
  }) async {
    try {
      Query<CompanyModel> query =
          FirestoreCompaniesRef.collection().orderBy(orderByField).limit(limit);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      // ConstraintApplier를 사용해서 쿼리 제약사항(필터링) 을 적용함
      if (queryConstraints != null && queryConstraints.isNotEmpty) {
        query = _constraintApplier.applyConstraints<CompanyModel>(
          query,
          queryConstraints,
        );
      }

      QuerySnapshot<CompanyModel> snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        return FirebasePaginatedResult<CompanyModel, CompanyModel>(
          items: [],
          lastDocument: null,
          hasMore: false,
          hasReversedQueryCallProceeded: true,
        );
      }

      final targetSnapshots = snapshot.docs;
      if (prevSnapshots != null) {
        targetSnapshots.addAll(prevSnapshots);
      }

      final items = await Future.wait(targetSnapshots.map((doc) async {
        final targetData = doc.data();

        return targetData;
      }).toList());

      final hasMore = snapshot.docs.length == limit;
      final newLastDocument =
          snapshot.docs.isNotEmpty ? snapshot.docs.last : lastDocument;

      if (newLastDocument == null && items.isNotEmpty) {
        throw Exception('Last document is null after fetching data.');
      }
      return FirebasePaginatedResult<CompanyModel, CompanyModel>(
        items: items,
        lastDocument: newLastDocument,
        hasMore: hasMore,
      );
    } catch (e) {
      throw Exception('Failed to fetch company List: $e');
    }
  }

  @override
  Future<List<DepartmentModel>> getDepartments(String companyId) async {
    final departmentModels = await FirestoreDepartmentsRef.collection(companyId).get();

    return [
      ...departmentModels.docs.map((e) => e.data()),
    ];
  }

  @override
  Future<List<PositionModel>> getPositions(String companyId) async {
    final positionModels = await FirestorePositionsRef.collection(companyId).get();

    return [
      ...positionModels.docs.map((e) => e.data()),
    ];
  }
}
