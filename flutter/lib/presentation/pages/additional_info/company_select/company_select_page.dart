import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/models/company_model.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/company_select_event.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/company_select_state.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/widgets/company_pagination_indicator_view.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/app_back_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/indicator/loading_indicator.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/custom_text_field.dart';
import 'package:saem_talk_talk/presentation/widgets/common/item/company_content_item_view.dart';
import 'package:saem_talk_talk/presentation/widgets/common/state/keep_alive_view.dart';

part 'widgets/company_list_view.p.dart';

part 'widgets/company_select_app_bar.p.dart';

part 'widgets/scaffold.p.dart';

part 'widgets/company_searched_term.dart';

class CompanySelectPage extends BasePage
    with CompanySelectEvent, CompanySelectState {
  CompanySelectPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    return _Scaffold(
      searchedTermView: _CompanySearchedTerm(),
      contentListView: _CompanyListView(),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return _AppBar(formKey);
  }
}
