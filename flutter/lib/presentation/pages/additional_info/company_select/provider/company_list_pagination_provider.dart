import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/firebase_query_constraints.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/features/company/use_case/get_company_list_use_case.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/provider/company_search_input_provider.dart';

part 'company_list_pagination_provider.g.dart';

@riverpod
Raw<PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>>
    companyListPagination(ref) {
  final pagingController =
      PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>(
    firstPageKey: null,
  );

  bool isDisposed = false;
  ref.onDispose(() {
    isDisposed = true;
    pagingController.dispose();
  });

  // 검색어 변경 시 새로고침
  ref.listen<String?>(
    companySearchInputProvider,
    (previous, next) {
      if (previous != next) {
        pagingController.refresh();
      }
    },
  );

  // 페이지 요청 리스너
  pagingController.addPageRequestListener((pageKey) async {
    final searchedTerm = ref.read(companySearchInputProvider);

    final params = GetCompanyListParams(
      lastDocument: pageKey,
      limit: 15,
      orderByField: (searchedTerm != null && searchedTerm.isNotEmpty)
          ? 'company_name'
          : 'created_at',
      queryConstraints: (searchedTerm != null && searchedTerm?.isNotEmpty)
          ? [
              GreaterThanOrEqualConstraint(
                fieldPath: 'company_name',
                value: searchedTerm,
              ),
              LessThanOrEqualConstraint(
                fieldPath: 'company_name',
                value: '$searchedTerm\uf8ff',
              ),
            ]
          : null,
    );

    final response = await getCompanyListUseCase.call(params);

    if (isDisposed) return;

    response.fold(
      onSuccess: (paginatedResult) {
        if (isDisposed) return;
        final newItems = paginatedResult.items;
        final isLastPage = !paginatedResult.hasMore;

        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = paginatedResult.lastDocument;
          pagingController.appendPage(newItems, nextPageKey);
        }
      },
      onFailure: (error) {
        if (isDisposed) return;
        pagingController.error = error;
      },
    );
  });

  return pagingController;
}
