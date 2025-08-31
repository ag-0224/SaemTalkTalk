import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/provider/company_list_pagination_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/provider/company_list_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/provider/company_search_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_name_input_provider.dart';

mixin class CompanySelectState {
  ///
  /// 페이지네이션 컨트롤러
  ///
  PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>
      pagingController(WidgetRef ref) {
    final searchedTerm = ref.watch(companyNameInputProvider);

    final pagingController = ref.watch(companyListPaginationProvider);
    return pagingController;
  }

  ///
  /// 페이지 컨트롤러
  ///
  PageController pageController(WidgetRef ref) =>
      ref.watch(companyListProvider.select((p) => p.pageController));

  ///
  /// 검색된 회사 이름
  ///
  String? searchedCompanyName(WidgetRef ref) => ref.watch(companySearchInputProvider);
}
